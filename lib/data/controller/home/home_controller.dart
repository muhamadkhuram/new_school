import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:play_lab/constants/my_strings.dart';
import 'package:play_lab/core/helper/shared_pref_helper.dart';
import 'package:play_lab/core/utils/url_container.dart';
import 'package:play_lab/data/model/account/profile_response_model.dart';
import 'package:play_lab/data/model/dashboard/dashboard_response_model.dart';
import 'package:play_lab/data/model/global/response_model/response_model.dart';
import 'package:play_lab/data/model/home/enum/enum.dart';
import 'package:play_lab/data/model/home/pop_up_ads/Pop_up_ads_model.dart';

import 'package:play_lab/data/repo/home_repo/home_repo.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../view/screens/bottom_nav_pages/home/widget/pop_up_widget/pop_up_widget.dart';

class HomeController extends GetxController {
  HomeRepo homeRepo;
  HomeController({required this.homeRepo});

  TextEditingController searchController = TextEditingController();
  Rx<int> sliderPageIndex = 0.obs;

  String sliderImagePath = '';
  List<Sliders> sliderList = [];

  List<TelevisionMain> televisionList = [];
  String televisionImagePath = '';

  List<RecentlyAdded> recentlyAddedList = [];
  String recentlyAddedImagePath = '';

  List<LatestSeries> latestSeriesList = [];
  String latestSeriesImagePath = '';

  List<Single> singleBannerList = [];
  String singleBannerImagePath = '';

  List<Trailer> trailerMovieList = [];
  String trailerImagePath = '';

  List<FreeZone> freeZoneList = [];
  String freeZoneImagePath = '';

  List<Featured> featuredMovieList = [];
  String featuredMovieImagePath = '';

  List<Rent> rentList = [];
  String rentImagePath = '';

  bool featuredMovieLoading = true;
  bool freeZoneMovieLoading = true;
  bool latestSeriesMovieLoading = true;
  bool liveTvLoading = true;
  bool recentMovieLoading = true;
  bool singleBannerImageLoading = true;
  bool trailerMovieLoading = true;
  bool sliderLoading = true;
  bool isSearchBarVisible = false;

  String? email;
  String? name;
  String? image;

  ProfileResponseModel profileResponseModel = ProfileResponseModel();
  Future<void> getAllData() async {
    getDashBoardData();
    getPopUpAds();
    if (!isGuest()) {
      profileResponseModel = await homeRepo.loadProfileInfo();
      update();
    }
  }

  void getDashBoardData() async {
    updateLoadingStatus(LoadingEnum.all, true);
    ResponseModel model = await homeRepo.dashboard();

    if (model.statusCode == 200) {
      DashBoardResponseModel responseModel =
          DashBoardResponseModel.fromJson(jsonDecode(model.responseJson));
      if (responseModel.data != null) {
        sliderImagePath = responseModel.data?.path?.landscape ?? '';
        televisionImagePath = responseModel.data?.path?.television ?? '';
        singleBannerImagePath = responseModel.data?.path?.landscape ?? '';
        featuredMovieImagePath = responseModel.data?.path?.portrait ?? '';
        recentlyAddedImagePath = responseModel.data?.path?.portrait ?? '';
        latestSeriesImagePath = responseModel.data?.path?.landscape ?? '';
        trailerImagePath = responseModel.data?.path?.portrait ?? '';
        freeZoneImagePath = responseModel.data?.path?.portrait ?? '';
        rentImagePath = responseModel.data?.path?.portrait ?? '';

        sliderList.clear();
        televisionList.clear();
        featuredMovieList.clear();
        recentlyAddedList.clear();
        latestSeriesList.clear();
        singleBannerList.clear();
        trailerMovieList.clear();
        freeZoneList.clear();
        rentList.clear();

        sliderList.addAll(responseModel.data?.data?.sliders ?? []);
        televisionList
            .addAll(responseModel.data?.data?.televisions!.data ?? []);
        featuredMovieList.addAll(responseModel.data?.data?.featured ?? []);
        recentlyAddedList.addAll(responseModel.data?.data?.recentlyAdded ?? []);
        latestSeriesList.addAll(responseModel.data?.data?.latestSeries ?? []);
      //  singleBannerList.addAll(responseModel.data?.data?.single ?? []);
        trailerMovieList.addAll(responseModel.data?.data?.trailer ?? []);
        freeZoneList.addAll(responseModel.data?.data?.freeZone ?? []);
        //rentList.addAll(responseModel.data?.data?.rent ?? []);
      }
    } else {
      updateLoadingStatus(LoadingEnum.all, false);
    }
    updateLoadingStatus(LoadingEnum.all, false);
  }

  String popAdsUrl = '';
  String popAdsClickUrl = '';
  void getPopUpAds() async {
    popAdsUrl = '';
    popAdsClickUrl = '';

    ResponseModel response = await homeRepo.getPopUpAds();
    if (response.statusCode == 200) {
      PopUpAdsModel popUpAdsModel =
          PopUpAdsModel.fromJson(jsonDecode(response.responseJson));
      if (popUpAdsModel.status?.toLowerCase() ==
          MyStrings.success.toLowerCase()) {
        String image = popUpAdsModel.data?.advertise?.content?.image ?? '';
        String imagePath = popUpAdsModel.data?.imagePath ?? '';
        if (image.isNotEmpty) {
          popAdsUrl = '${UrlContainer.baseUrl}$imagePath/$image';
          popAdsClickUrl = popUpAdsModel.data?.advertise?.content?.link ?? '';
          await Future.delayed(const Duration(seconds: 5));
          PopupBanner(
            context: Get.context!,
            useDots: false,
            images: [
              popAdsUrl,
            ],
            onClick: (index) async {
              await launchUrl(
                Uri.parse(popAdsClickUrl),
                mode: LaunchMode.platformDefault,
              );
            },
          ).show();
        }
      }
    }
  }

  bool isAuthorized() {
    String? value = homeRepo.apiClient.sharedPreferences
        .getString(SharedPreferenceHelper.accessTokenKey);
    return value == null
        ? false
        : value.isEmpty
            ? false
            : true;
  }

  void updateLoadingStatus(LoadingEnum loadingEnum, bool status) {
    if (loadingEnum == LoadingEnum.all) {
      featuredMovieLoading = status;
      freeZoneMovieLoading = status;
      latestSeriesMovieLoading = status;
      liveTvLoading = status;
      recentMovieLoading = status;
      singleBannerImageLoading = status;
      trailerMovieLoading = status;
      sliderLoading = status;
      update();
    }
    if (loadingEnum == LoadingEnum.featureMovieLoading) {
      featuredMovieLoading = status;
      update();
    } else if (loadingEnum == LoadingEnum.freeZoneMovieLoading) {
      freeZoneMovieLoading = status;
      update();
    } else if (loadingEnum == LoadingEnum.latestSeriesMovieLoading) {
      latestSeriesMovieLoading = status;
      update();
    } else if (loadingEnum == LoadingEnum.liveTvLoading) {
      liveTvLoading = status;
      update();
    } else if (loadingEnum == LoadingEnum.recentMovieLoading) {
      recentMovieLoading = status;
      update();
    } else if (loadingEnum == LoadingEnum.singleBannerImageLoading) {
      singleBannerImageLoading = status;
      update();
    } else if (loadingEnum == LoadingEnum.trailerMovieLoading) {
      trailerMovieLoading = status;
      update();
    } else if (loadingEnum == LoadingEnum.sliderLoading) {
      sliderLoading = status;
      update();
    }
  }

  bool isGuest() {
    homeRepo.apiClient.initToken();
    String token = homeRepo.apiClient.token;
    if (token.isEmpty) {
      return true;
    }
    return false;
  }

  toggleSearchBarVisible() {
    isSearchBarVisible = !isSearchBarVisible;
    update();
  }

  clearData() {
    isSearchBarVisible = false;
    sliderList = [];
    televisionList = [];
    featuredMovieList = [];
    recentlyAddedList = [];
    latestSeriesList = [];
    singleBannerList = [];
    trailerMovieList = [];
    freeZoneList = [];
    rentList = [];
    update();
  }
}
