import 'dart:convert';
import 'package:get/get.dart';
import 'package:play_lab/core/helper/shared_pref_helper.dart';
import 'package:play_lab/data/model/global/response_model/response_model.dart';
import 'package:play_lab/data/repo/auth/general_setting_repo.dart';
import 'package:play_lab/view/components/show_custom_snackbar.dart';

import '../../constants/my_strings.dart';
import '../../core/helper/messages.dart';
import '../../core/route/route.dart';
import '../model/general_setting/general_settings_response_model.dart';
import '../repo/splash/splash_repo.dart';
import 'localization/localization_controller.dart';

class SplashController extends GetxController implements GetxService {
  SplashRepo splashRepo;
  GeneralSettingRepo gsRepo;
  LocalizationController localizationController;
  bool isLoading = true;
  String imageUrl = '';

  SplashController({required this.splashRepo, required this.gsRepo, required this.localizationController});

  gotoNextPage() async {
    await loadLanguage();

    GeneralSettingsResponseModel model = await gsRepo.getGeneralSetting();
    if (model.data == null) {
      return;
    }
    isLoading = false;
    update();
    bool isRemember = splashRepo.apiClient.sharedPreferences.getBool(SharedPreferenceHelper.rememberMeKey) ?? false;
    if (isRemember) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAndToNamed(RouteHelper.homeScreen);
      });
    } else {
      ResponseModel responseModel = await splashRepo.getOnboardingData();
      if (responseModel.statusCode == 200) {
        Future.delayed(const Duration(seconds: 1), () {
          if (splashRepo.apiClient.getAppOpeningStatus() == false) {
            Get.offAndToNamed(RouteHelper.onboardScreen, arguments: responseModel);
          } else {
            splashRepo.apiClient.cleanPreferencesData();
            Get.offAndToNamed(RouteHelper.homeScreen);
          }
        });
      } else if (responseModel.statusCode == 503) {
        Get.offAndToNamed(RouteHelper.loginScreen, arguments: responseModel);
      } else {
        CustomSnackbar.showCustomSnackbar(errorList: [responseModel.message], msg: [], isError: true);
      }
    }
  }

  Future<bool> initSharedData() {
    if (!gsRepo.apiClient.sharedPreferences.containsKey(SharedPreferenceHelper.countryCode)) {
      return gsRepo.apiClient.sharedPreferences.setString(SharedPreferenceHelper.countryCode, MyStrings.myLanguages[0].countryCode);
    }
    if (!gsRepo.apiClient.sharedPreferences.containsKey(SharedPreferenceHelper.langCode)) {
      return gsRepo.apiClient.sharedPreferences.setString(SharedPreferenceHelper.langCode, MyStrings.myLanguages[0].languageCode);
    }
    return Future.value(true);
  }

  Future<void> loadLanguage() async {
     try {
    // Load the current language settings
    await localizationController.loadCurrentLanguage();
    final String languageCode = localizationController.locale.languageCode;
    print("languageCode $languageCode");

    // Fetch language data from repository
    final ResponseModel response = await gsRepo.getLanguage(languageCode);

    if (response.statusCode == 200) {
      final Map<String, dynamic> resJson = jsonDecode(response.responseJson);
      
      // Save the language list for future use
      await saveLanguageList(response.responseJson);

      // Process translation data from the 'file' field
      final Map<String, dynamic> translationData = 
          resJson['data']['file'] ?? {};

      // Convert translation data to required format
      final Map<String, String> translationMap = {};
      translationData.forEach((key, value) {
        translationMap[key] = value.toString();
      });

      // Create language map using current locale
      final Map<String, Map<String, String>> languageMap = {
        languageCode: translationMap
      };

      // Add translations to GetX
      Get.addTranslations(Messages(languages: languageMap).keys);

    } else if (response.statusCode == 503) {
      // Handle unauthorized access
      await Get.offAndToNamed(RouteHelper.loginScreen, arguments: response);
    } else {
      // Handle other errors
      CustomSnackbar.showCustomSnackbar(
        errorList: [response.message],
        msg: [], 
        isError: true
      );
    }
  } catch (e) {
    CustomSnackbar.showCustomSnackbar(
      errorList: [e.toString()],
      msg: [], 
      isError: true
    );
    print('Initial language load error: ${e.toString()}');
  }
  }

   saveLanguageList(String languageJson) async {
    await gsRepo.apiClient.sharedPreferences.setString(SharedPreferenceHelper.langListKey, languageJson);
    return;
  }
}
