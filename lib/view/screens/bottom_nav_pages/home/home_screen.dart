import 'dart:io';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart' as ads;
import 'package:play_lab/core/utils/my_images.dart';
import 'package:play_lab/core/utils/styles.dart';
import 'package:play_lab/core/utils/url_container.dart';
import 'package:play_lab/data/controller/localization/localization_controller.dart';
import 'package:play_lab/view/components/auth_image.dart';
import 'package:play_lab/view/components/buttons/category_button.dart';
import 'package:play_lab/view/components/image/my_image_widget.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/category_widget/category_widget.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/divider_section/divider_section.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/latest_trailer_widget/latest_trailer_widget.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/recently_added_widget/recently_added_widget.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/rent_items_widget/rent_items_widget.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/searchbar/searchBarWidget.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/show_more_row/show_more_widget.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/single_banner_widget/single_banner_widget.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/single_banner_widget/single_banner_widget_two.dart';
import 'package:play_lab/view/will_pop_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../constants/my_strings.dart';
import '../../../../data/controller/account/profile_controller.dart';
import '../../../../data/controller/live_tv_controller/live_tv_controller.dart';
import '../../../../data/controller/live_tv_details_controller/live_tv_details_controller.dart';
import '../../../../data/controller/payment/PaymentController.dart';
import '../../../../data/repo/account/profile_repo.dart';
import '../../../../data/repo/live_tv_repo/live_tv_repo.dart';
import '../../../components/nav_drawer/custom_nav_drawer.dart';
import 'package:play_lab/core/route/route.dart';
import 'package:play_lab/core/utils/dimensions.dart';
import 'package:play_lab/core/utils/my_color.dart';
import 'package:play_lab/data/controller/category/category_controller/category_controller.dart';
import 'package:play_lab/data/controller/home/home_controller.dart';
import 'package:play_lab/data/controller/nav_controller/nav_drawer_controller.dart';
import 'package:play_lab/data/repo/category_repo/category_repo/category_repo.dart';
import 'package:play_lab/data/repo/home_repo/home_repo.dart';
import 'package:play_lab/data/repo/nav_drawer_repo/nav_drawer_repo.dart';
import 'package:play_lab/data/services/api_service.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/featured_movie_widget/featured_movie_widget.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/free_zone/free_zone.dart';
import 'package:play_lab/view/screens//bottom_nav_pages/home/widget/latest_series.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/live_tv_widget/live_tv_widget.dart';
import 'package:play_lab/view/screens/bottom_nav_pages/home/widget/slider_widget/slider_widget.dart';
import 'package:play_lab/view/components/bottom_Nav/bottom_nav.dart';
import 'package:play_lab/view/components/show_more_row/show_more_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //ads.BannerAd? _bannerAd;
  bool isLoaded = false;

  final adUnitId = Platform.isAndroid
      ? MyStrings.homeAndroidBanner
      : MyStrings.homeIOSBanner;

  // void loadAd() {
  //   _bannerAd = ads.BannerAd(
  //     adUnitId: adUnitId,
  //     request: const ads.AdRequest(),
  //     size: ads.AdSize.banner,
  //     listener: ads.BannerAdListener(
  //       onAdLoaded: (ad) {
  //         setState(() {
  //           isLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, err) {
  //         ad.dispose();
  //       },
  //     ),
  //   )..load();
  // }

  int currentPageIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    final homeRepo = Get.put(HomeRepo(apiClient: Get.find()));
    Get.put(CategoryRepo(apiClient: Get.find()));
    Get.put(CategoryController(repo: Get.find()));
    Get.put(NavDrawerRepo(apiClient: Get.find()));
    Get.put(LiveTvRepo(apiClient: Get.find()));
    final liveTvController = Get.put(LiveTvController(repo: Get.find()));

    Get.put(NavDrawerController(sharedPreferences: Get.find()));
    final homeController = Get.put(HomeController(homeRepo: Get.find()));
    Get.put(ProfileRepo(
      apiClient: Get.find(),
    ));
    Get.put(ProfileController(profileRepo: Get.find()));

    Get.find<ProfileController>().loadProfileInfo();
    final controller = Get.put(LiveTvDetailsController(repo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // if (homeRepo.apiClient.isShowAdMobAds()) {
      //  loadAd();
      liveTvController.getLiveTvcategories();

      liveTvController.getLiveTv();
      //  }

      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: MyColor.colorBlack,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: MyColor.colorBlack,
          systemNavigationBarIconBrightness: Brightness.light));
      homeController.getAllData();
      Get.find<CategoryController>().fetchInitialCategoryData();
    });
  }

  @override
  void dispose() {
    // _bannerAd?.dispose();
    super.dispose();
  }

  changeCurrentPageIndex(int index) {
    currentPageIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: MyColor.transparentColor),
        child: WillPopWidget(
          nextRoute: '',
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              TextEditingController().clear();
            },
            child: SafeArea(
              child: Scaffold(
                onDrawerChanged: (isOpened) {
                  if (!isOpened) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    TextEditingController().clear();
                  }
                },
                onEndDrawerChanged: (isOpened) {},
                key: scaffoldKey,
                backgroundColor: MyColor.colorBlack,
                drawer: const NavigationDrawerWidget(),
                body: RefreshIndicator(
                  backgroundColor: MyColor.cardBg,
                  color: MyColor.primaryColor,
                  onRefresh: () async {
                    controller.getAllData();
                  },
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //  const SizedBox(height: 95),
                            Stack(
                              children: [
                                // Slider Widget (Bottom Layer)
                                const SliderWidget().animate().addEffects(
                                  const [
                                    FadeEffect(
                                      delay: Duration(microseconds: 500),
                                      duration: Duration(microseconds: 10000),
                                    ),
                                  ],
                                ),

                                // Gradient Overlay
                                Container(
                                  width: double.infinity,
                                  height: 80, // Adjust this height as needed
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.black.withOpacity(0.6),
                                        Colors.black.withOpacity(0.5),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  // top: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: double.infinity,
                                    height: 80, // Adjust this height as needed
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.3),
                                          // Colors.black.withOpacity(0.5),
                                          // Colors.black.withOpacity(0.4),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                // Search Components (Top Layer)
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            Get.find<LocalizationController>()
                                                    .isLtr
                                                ? MainAxisAlignment.spaceBetween
                                                : MainAxisAlignment
                                                    .spaceBetween,
                                        children: [
                                          Image.asset(
                                            MyImages.logo,
                                            width: 100,
                                            height: 30,
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: controller
                                                    .toggleSearchBarVisible,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  // decoration: const BoxDecoration(
                                                  //   shape: BoxShape.circle,
                                                  //   color: MyColor.bgColor,
                                                  //),
                                                  child: Icon(
                                                    controller
                                                            .isSearchBarVisible
                                                        ? Icons.close
                                                        : Icons.search_rounded,
                                                    color: MyColor.colorWhite,
                                                    size: 25,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 20,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.find<ApiClient>()
                                                            .isAuthorizeUser()
                                                        ? scaffoldKey
                                                            .currentState
                                                            ?.openDrawer()
                                                        : Get.toNamed(
                                                            RouteHelper
                                                                .loginScreen);
                                                  },
                                                  child: const Icon(
                                                      Icons
                                                          .account_circle_rounded,
                                                      color:
                                                          MyColor.colorWhite),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Visibility(
                                      visible: controller.isSearchBarVisible,
                                      child: const SearchBarWidget()
                                          .animate()
                                          .moveX(
                                            begin: 200,
                                            duration: 500.ms,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                                height: Dimensions.spaceBetweenCategory),
                            controller.televisionList.isNotEmpty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ShowMoreText(
                                        headerText: MyStrings.liveTV,
                                        press: () {
                                          Get.toNamed(
                                              RouteHelper.allLiveTVScreen);
                                        },
                                      ),
                                      const SizedBox(
                                          height:
                                              Dimensions.spaceBetweenCategory),
                                      const LiveTvWidget(
                                        showMenuBtm: true,
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),

                            controller.recentlyAddedList.isNotEmpty
                                ? Semantics(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                            height: Dimensions
                                                .spaceBetweenCategory),
                                        ShowMoreText(
                                            headerText: MyStrings.recentlyAdded,
                                            isShowMoreVisible: false,
                                            press: () {}),
                                        const SizedBox(
                                            height: Dimensions
                                                .spaceBetweenCategory),
                                        const RecentlyAddedWidget(),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            const DividerSection(),
                            controller.rentList.isNotEmpty
                                ? Semantics(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ShowMoreText(
                                            headerText:
                                                MyStrings.premiumItems.tr,
                                            isShowMoreVisible: false,
                                            press: () {}),
                                        const SizedBox(
                                            height: Dimensions
                                                .spaceBetweenCategory),
                                        const RentWidget(),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            const DividerSection(),
                            Semantics(child: const SingleBannerWidget()),
                            const DividerSection(),
                            ShowMoreText(
                                isShowMoreVisible: false,
                                headerText: MyStrings.featuredItem,
                                press: () {}),
                            const SizedBox(
                                height: Dimensions.spaceBetweenCategory),
                            const FeaturedMovieWidget(),
                            const SizedBox(
                                height: Dimensions.spaceBetweenCategory),
                            const DividerSection(topSpace: 10),
                            ShowMoreRowWidget(
                              value: MyStrings.ourFreeZone,
                              isShowMoreVisible: true,
                              press: () {
                                Get.toNamed(RouteHelper.allFreeZoneScreen);
                              },
                            ),
                            const SizedBox(
                                height: Dimensions.spaceBetweenCategory),
                            const FreeZoneWidget(),
                            const DividerSection(),
                            const SecondSingleBannerWidget(),
                            controller.trailerMovieList.isNotEmpty
                                ? Column(
                                    children: [
                                      const DividerSection(),
                                      ShowMoreRowWidget(
                                        value: MyStrings.latestTrailer,
                                        isShowMoreVisible: false,
                                        press: () {},
                                      ),
                                      const SizedBox(
                                        height: Dimensions.spaceBetweenCategory,
                                      ),
                                      const LatestTrailerWidget(),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            const DividerSection(),
                            ShowMoreText(
                                isShowMoreVisible: true,
                                headerText: MyStrings.latestSeries,
                                press: () {
                                  Get.toNamed(RouteHelper.allEpisodeScreen);
                                }),
                            const SizedBox(
                              height: Dimensions.spaceBetweenCategory,
                            ),
                            const LatestSeries(),
                            const SizedBox(
                              height: Dimensions.spaceBetweenCategory,
                            ),
                          ],
                        ),
                      ),
                      ////  if (_bannerAd != null &&
                      //      controller.homeRepo.apiClient.isShowAdMobAds())
                      // Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child: SafeArea(
                      //     child: SizedBox(
                      //       width: _bannerAd!.size.width.toDouble(),
                      //       height: _bannerAd!.size.height.toDouble(),
                      //       child: ads.AdWidget(ad: _bannerAd!),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget buildHeader(
    BuildContext context, {
    required String urlImage,
    required String name,
    required String email,
    required bool isSubscribed,
    bool isGuest = false,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isGuest
              ? const AuthImageWidget()
              : Row(
                  children: [
                    urlImage.isEmpty
                        ? const CircleAvatar(
                            radius: 16,
                            backgroundImage: AssetImage(MyImages.profile),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: MyColor.colorWhite),
                                shape: BoxShape.circle),
                            child: MyImageWidget(
                              imageUrl:
                                  '${UrlContainer.baseUrl}/assets/images/user/profile/$urlImage',
                              isProfile: true,
                              height: 40,
                              width: 40,
                              radius: 50,
                            ),
                          ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: mulishBold.copyWith()),
                        const SizedBox(height: Dimensions.space5),
                        Text(email, style: mulishLight.copyWith()),
                      ],
                    ),
                  ],
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CategoryButton(
                text: MyStrings.subscribed,
                press: () {},
                color: MyColor.secondaryColor,
              ),
              // const SizedBox(height: Dimensions.space5),
              // CategoryButton(
              //   text: '12-March-2025',
              //   press: () {},
              //   color: MyColor.secondaryColor,
              // ),
            ],
          )
        ],
      );
}

class Tuple<A, B> {
  final A item1;
  final B item2;

  Tuple(this.item1, this.item2);

  @override
  String toString() => '($item1, $item2)';
}
