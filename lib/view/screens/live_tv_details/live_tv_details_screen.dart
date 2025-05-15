import 'package:flutter_animate/flutter_animate.dart';
import 'package:play_lab/core/utils/my_color.dart';
import 'package:play_lab/data/controller/live_tv_details_controller/live_tv_details_controller.dart';
import 'package:play_lab/data/repo/live_tv_repo/live_tv_repo.dart';
import 'package:play_lab/data/services/api_service.dart';
import 'package:play_lab/view/components/text/header_view_text.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_lab/view/screens/live_tv_details/widget/live_tv_details_shimmer_widget.dart';
import 'package:play_lab/view/screens/live_tv_details/widget/related_item_list.dart';
import '../../../constants/my_strings.dart';
import '../../components/custom_sized_box.dart';
import '../bottom_nav_pages/home/widget/live_tv_widget/live_tv_widget.dart';
import '../movie_details/widget/body_widget/team_row.dart';
import '../movie_details/widget/details_text_widget/details_text.dart';

class LiveTvDetailsScreen extends StatefulWidget {
  const LiveTvDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LiveTvDetailsScreen> createState() => _LiveTvDetailsScreenState();
}

class _LiveTvDetailsScreenState extends State<LiveTvDetailsScreen> {
  @override
  void initState() {
    final argument = Get.arguments;

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(LiveTvRepo(apiClient: Get.find()));
    final controller = Get.put(LiveTvDetailsController(repo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.initData(argument);
    });
  }

  @override
  void dispose() {
    Get.find<LiveTvDetailsController>().clearAllData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveTvDetailsController>(
        builder: (controller) => Scaffold(
              backgroundColor: MyColor.secondaryColor,
              body: controller.isLoading
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const LiveTvDetailsShimmerWidget())
                  : SingleChildScrollView(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.chewieController == null
                                  ? SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: const LiveTvDetailsShimmerWidget())
                                  : Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.all(0),
                                      child: controller
                                              .chewieController!
                                              .videoPlayerController
                                              .value
                                              .isInitialized
                                          ? Chewie(
                                              controller:
                                                  controller.chewieController!,
                                            )
                                          : const Text("------------"),
                                    ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: TeamRow(
                                      firstText:
                                          controller.tvObject.title?.tr ?? '',
                                      secondText: '')),
                              const CustomSizedBox(
                                height: 15,
                              ),
                              const Divider(
                                height: 1,
                                color: MyColor.bodyTextColor,
                              ),
                              const CustomSizedBox(
                                height: 15,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const LiveTvWidget(showMenuBtm:   false,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    // child: TeamRow(
                                    //     firstText:
                                    //         MyStrings.channelDescription.tr,
                                    //     secondText: '')),
                                  ),
                                  const CustomSizedBox(),
                                  // Padding(
                                  //     padding: const EdgeInsets.only(left: 10),
                                  //     child: ExpandedTextWidget(
                                  //       teamLine: 6,
                                  //       text: controller
                                  //               .tvObject.description?.tr ??
                                  //           '',
                                  //     )),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ).animate().fade(),
                              HeaderViewText(
                                header: MyStrings.recommended.tr,
                                isShowMoreVisible: false,
                              ),
                              const RelatedTvList(),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SafeArea(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      top: 15,
                                    ),
                                    child: GestureDetector(
                                        onTap: () {
                                          controller.clearAllData();
                                          Get.back();
                                        },
                                        child: const Icon(
                                          Icons.arrow_back,
                                          color: MyColor.colorWhite,
                                          size: 20,
                                        ))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ));
  }
}
