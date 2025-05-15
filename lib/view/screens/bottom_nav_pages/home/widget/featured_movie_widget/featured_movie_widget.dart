import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../../core/route/route.dart';
import '../../../../../../core/utils/my_color.dart';
import '../../../../../../../core/utils/dimensions.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/url_container.dart';
import '../../../../../../data/controller/home/home_controller.dart';
import 'package:get/get.dart';
import '../../shimmer/portrait_movie_shimmer.dart';
import '../custom_network_image/custom_network_image.dart';

class FeaturedMovieWidget extends StatefulWidget {
  const FeaturedMovieWidget({Key? key}) : super(key: key);

  @override
  State<FeaturedMovieWidget> createState() => _FeaturedMovieWidgetState();
}

class _FeaturedMovieWidgetState extends State<FeaturedMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Padding(
              padding:
                  const EdgeInsets.only(left: Dimensions.homePageLeftMargin),
              child: controller.featuredMovieLoading
                  ? const SizedBox(height: 180, child: PortraitShimmer())
                  : SizedBox(
                      // width: 100,
                      height: 180,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        //padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                            children: List.generate(
                                controller.featuredMovieList.length >= 8
                                    ? 8
                                    : controller.featuredMovieList.length,
                                (index) => GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RouteHelper.movieDetailsScreen,
                                            arguments: [
                                              controller
                                                  .featuredMovieList[index].id,
                                              -1
                                            ]);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: Dimensions
                                                .gridViewMainAxisSpacing),
                                        width: 120,
                                        child: Stack(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                    child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              Dimensions
                                                                  .cardRadius)),
                                                  child: CustomNetworkImage(
                                                    imageUrl:
                                                        '${UrlContainer.baseUrl}${controller.featuredMovieImagePath}${controller.featuredMovieList[index].image?.portrait}',
                                                    height: 200,
                                                  ),
                                                )),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0,
                                                          top: 8.0,
                                                          right: 0),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(8),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8)),
                                                  ),
                                                  child: Text(
                                                      controller
                                                              .featuredMovieList[
                                                                  index]
                                                              .title
                                                              ?.tr ??
                                                          '',
                                                      style: mulishSemiBold
                                                          .copyWith(
                                                              color: MyColor
                                                                  .colorWhite,
                                                              fontSize:
                                                                  Dimensions
                                                                      .fontSmall,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis)),
                                                ),
                                              ]
                                                  .animate(interval: 400.ms)
                                                  .fade(duration: 300.ms),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))),
                      ),
                    ),
            ));
  }
}
