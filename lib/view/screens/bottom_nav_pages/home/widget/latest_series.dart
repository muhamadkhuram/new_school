import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_lab/core/utils/dimensions.dart';
import 'package:play_lab/core/utils/my_color.dart' show MyColor;
import 'package:play_lab/core/utils/styles.dart';
import 'package:play_lab/core/utils/url_container.dart';
import 'package:play_lab/data/controller/home/home_controller.dart';
import '../../../bottom_nav_pages/home/widget/custom_network_image/custom_network_image.dart';
import '../shimmer/latest_series_shimmer.dart';

class LatestSeries extends StatefulWidget {
  const LatestSeries({Key? key}) : super(key: key);

  @override
  State<LatestSeries> createState() => _LatestSeriesState();
}

class _LatestSeriesState extends State<LatestSeries> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Padding(
              padding:
                  const EdgeInsets.only(left: Dimensions.homePageLeftMargin),
              child: controller.latestSeriesMovieLoading
                  ? const LatestSeriesShimmer()
                  : Container(
                      height: 200,
                      padding: const EdgeInsets.only(
                          left: Dimensions.homePageLeftMargin),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.latestSeriesList.length >= 8
                              ? 8
                              : controller.trailerMovieList.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  print(
                                      '${UrlContainer.baseUrl}${controller.latestSeriesImagePath}/${controller.latestSeriesList[index].image?.landscape}');
                                  // Get.toNamed(RouteHelper.movieDetailsScreen, arguments: [controller.latestSeriesList[index].id, -1]);
                                },
                                child: Container(
                                  width: 120,
                                  margin: const EdgeInsets.only(
                                      right:
                                          Dimensions.gridViewMainAxisSpacing),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.cardRadius),
                                              child: CustomNetworkImage(
                                                imageUrl:
                                                    '${UrlContainer.baseUrl}${controller.latestSeriesImagePath}/${controller.latestSeriesList[index].image?.landscape}',
                                                width: 120,
                                                height: 160,
                                                //  boxFit: BoxFit.cover,
                                              )),
                                          const SizedBox(
                                            height: Dimensions
                                                .spaceBetweenTextAndImage,
                                          ),
                                          Text(
                                              controller.latestSeriesList[index]
                                                      .title?.tr ??
                                                  '',
                                              style: mulishSemiBold.copyWith(
                                                  color: MyColor.colorWhite,
                                                  fontSize:
                                                      Dimensions.fontSmall,
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ))),
            ));
  }
}
