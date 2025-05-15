import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_lab/constants/my_strings.dart';
import 'package:play_lab/data/controller/live_tv_controller/live_tv_controller.dart';
import 'package:play_lab/data/controller/live_tv_details_controller/live_tv_details_controller.dart';
import '../../../../../../core/route/route.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../core/utils/my_color.dart';
import '../../../../../../core/utils/my_images.dart';
import '../../../../../../core/utils/url_container.dart';
import '../../../../../../data/controller/home/home_controller.dart';
import '../../../../../../data/model/live_tv/live_tv_response_model.dart';
import '../../../../all_live_tv/widget/live_tv_grid_item/live_tv_grid_item.dart';
import '../../shimmer/live_tv_shimmer.dart';
import '../custom_network_image/custom_network_image.dart';

class LiveTvWidget extends StatefulWidget {
  final bool showMenuBtm;
  const LiveTvWidget({Key? key, required this.showMenuBtm}) : super(key: key);

  @override
  State<LiveTvWidget> createState() => _LiveTvWidgetState();
}

class _LiveTvWidgetState extends State<LiveTvWidget> {
  void showTvChannelBottomSheet(
    BuildContext context,
    List<String> categories,
    List<MainTelevisionModel> tvList,
  ) {
    final controller = Get.find<LiveTvController>();
    final tabs = [...categories.map((e) => e).toList()];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DefaultTabController(
          length: tabs.length,
          child: GetBuilder<LiveTvController>(builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(height: 16),
                TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.red,
                  tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: TabBarView(
                    children: tabs.map((tabName) {
                      List<MainTelevisionModel> filteredList = tabName == 'All'
                          ? controller.televisionList
                          : controller.televisionList
                              .where((tv) => tv.category?.name == tabName)
                              .toList();

                      ScrollController scrollController = ScrollController();
                      scrollController.addListener(() async {
                        if (scrollController.position.pixels ==
                                scrollController.position.maxScrollExtent &&
                            controller.hasNext()) {
                          Get.find<LiveTvController>().getPaginateTV();
                        }
                      });

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          controller: scrollController,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            final tv = filteredList[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();

                                Get.toNamed(RouteHelper.liveTvDetailsScreen,
                                    arguments: tv.id);
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      '${UrlContainer.baseUrl}${controller.televisionImagePath}/${tv.image}',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    tv.title ?? '',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(left: Dimensions.homePageLeftMargin),
        child: controller.liveTvLoading
            ? SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: const LiveTvShimmer())
            : Row(
                children: [
                  widget.showMenuBtm
                      ? GestureDetector(
                          onTap: () => showTvChannelBottomSheet(
                              context,
                              Get.find<LiveTvController>().tvcategories,
                              Get.find<LiveTvController>().televisionList),
                          child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: 60, minHeight: 40),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.asset(
                                    MyImages.dots,
                                    height: 30,
                                    colorBlendMode: BlendMode.overlay,
                                    color: Colors.black,
                                    //  fadeInDuration: Duration(microseconds: 500),
                                    width: 50,
                                    // imageUrl: MyImages.dots,
                                    fit: BoxFit.fitHeight,
                                  ))),
                        )
                      : SizedBox.shrink(),
                  Expanded(
                    child: SingleChildScrollView(
                      //  physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.televisionList.length,
                          (index) => LiveTvGridItem(
                              borderColor: (controller
                                              .televisionList[index].url ==
                                          Get.find<LiveTvDetailsController>()
                                              .videoUrl &&
                                      !widget.showMenuBtm)
                                  ? Colors.red
                                  : null,
                              liveTvName:
                                  controller.televisionList[index].title?.tr ??
                                      '',
                              imageUrl:
                                  '${UrlContainer.baseUrl}${controller.televisionImagePath}/${controller.televisionList[index].image}',
                              press: () {
                                !widget.showMenuBtm
                                    ? {
                                        Get.find<LiveTvDetailsController>()
                                            .clearAllData(),
                                        Get.find<LiveTvDetailsController>()
                                            .initData(controller
                                                .televisionList[index].id!),
                                        setState(() {})
                                      }
                                    : Get.toNamed(
                                        RouteHelper.liveTvDetailsScreen,
                                        arguments: controller
                                            .televisionList[index].id);
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
