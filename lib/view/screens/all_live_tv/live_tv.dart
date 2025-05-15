import 'package:play_lab/data/model/live_tv/live_tv_details_response_model.dart';
import 'package:play_lab/view/screens/all_live_tv/widget/all_live_tv_shimmer/all_live_tv_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_lab/core/route/route.dart';
import 'package:play_lab/core/utils/my_color.dart';
import 'package:play_lab/data/controller/live_tv_controller/live_tv_controller.dart';
import 'package:play_lab/data/repo/live_tv_repo/live_tv_repo.dart';
import 'package:play_lab/data/services/api_service.dart';
import 'package:play_lab/view/components/app_bar/custom_appbar.dart';
import 'package:play_lab/view/screens/all_live_tv/widget/live_tv_grid_item/live_tv_grid_item.dart';

import '../../../constants/my_strings.dart';
import '../../../core/utils/url_container.dart';
import '../../components/bottom_Nav/bottom_nav.dart';
import '../../components/nav_drawer/custom_nav_drawer.dart';

class AllLiveTvScreen extends StatefulWidget {
  const AllLiveTvScreen({Key? key}) : super(key: key);

  @override
  State<AllLiveTvScreen> createState() => _AllLiveTvScreenState();
}

class _AllLiveTvScreenState extends State<AllLiveTvScreen> {
  String selectedValue = 'All';
  List<String> items = ['Apple', 'Banana', 'Cherry', 'Mango'];
  final ScrollController _controller = ScrollController();

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      if (Get.find<LiveTvController>().hasNext()) {
        Get.find<LiveTvController>().getPaginateTV();
      }
    }
  }

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    // Get.put(LiveTvRepo(apiClient: Get.find()));
    final liveTvController = Get.put(LiveTvController(repo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // liveTvController.getLiveTv();
      _controller.addListener(_scrollListener);
    });
  }

  List<dynamic> _getFilteredTelevisionList(LiveTvController controller) {
    return controller.getFilteredList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveTvController>(
        builder: (controller) => Scaffold(
            bottomNavigationBar: const CustomBottomNav(
              currentIndex: 4,
            ),
            drawer: const NavigationDrawerWidget(),
            backgroundColor: MyColor.colorBlack,
            appBar: const CustomAppBar(
              isTitleCenter: true,
              title: MyStrings.allTV,
              isShowBackBtn: false,
            ),
            body: controller.isLoading
                ? const AllLiveTvShimmer()
                : Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DropdownButton<String>(
                                value: selectedValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                                underline: Container(
                                  height: 2,
                                  color: Colors.blueAccent,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
                                  controller.selectedCategory = selectedValue;
                                },
                                items: controller.tvcategories
                                    .map<DropdownMenuItem<String>>(
                                        (dynamic category) {
                                  return DropdownMenuItem<String>(
                                    value: category,
                                    child: Text(category),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                              itemCount: _getFilteredTelevisionList(controller)
                                      .length +
                                  (controller.hasNext() ? 1 : 0),
                              controller: _controller,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 3,
                                      childAspectRatio: 1),
                              itemBuilder: (context, index) {
                                final filteredList =
                                    _getFilteredTelevisionList(controller);

                                if (filteredList.length == index) {
                                  return controller.isPaginating
                                      ? const SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Center(
                                              child: CircularProgressIndicator(
                                            color: MyColor.primaryColor,
                                          )))
                                      : const SizedBox.shrink();
                                }

                                return AllLiveTvGridItem(
                                    liveTvName: filteredList[index].title ?? '',
                                    imageUrl:
                                        '${UrlContainer.baseUrl}${controller.televisionImagePath}/${filteredList[index].image}',
                                    press: () {
                                      Get.toNamed(
                                          RouteHelper.liveTvDetailsScreen,
                                          arguments: filteredList[index].id);
                                    });
                              }),
                        )
                      ],
                    ))));
  }
}
