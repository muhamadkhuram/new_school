import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_lab/core/helper/messages.dart';
import 'package:play_lab/core/helper/shared_pref_helper.dart';
import 'package:play_lab/core/utils/url_container.dart';
import 'package:play_lab/data/controller/localization/localization_controller.dart';
import 'package:play_lab/data/model/global/response_model/response_model.dart';
import 'package:play_lab/data/model/language/language_model.dart';
import 'package:play_lab/data/model/language/main_language_response_model.dart';
import 'package:play_lab/data/repo/auth/general_setting_repo.dart';
import 'package:play_lab/view/components/show_custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLanguageController extends GetxController {
  GeneralSettingRepo repo;
  LocalizationController localizationController;
  MyLanguageController(
      {required this.repo, required this.localizationController});

  bool isLoading = true;
  String languageImagePath = "";
  List<MyLanguageModel> langList = [];

  void loadLanguage() {
    langList.clear();
    isLoading = true;

    SharedPreferences pref = repo.apiClient.sharedPreferences;
    String languageString =
        pref.getString(SharedPreferenceHelper.langListKey) ?? '';

    var language = jsonDecode(languageString);
    MainLanguageResponseModel model =
        MainLanguageResponseModel.fromJson(language);
    languageImagePath = "${UrlContainer.baseUrl}${model.data?.imagePath ?? ''}";
    if (model.data?.languages != null && model.data!.languages!.isNotEmpty) {
      for (var listItem in model.data!.languages!) {
        MyLanguageModel model = MyLanguageModel(
            languageCode: listItem.code ?? '',
            countryCode: listItem.name ?? '',
            languageName: listItem.name ?? '',
            imageUrl: listItem.image ?? '');
        langList.add(model);
      }
    }

    String languageCode =
        pref.getString(SharedPreferenceHelper.langCode) ?? 'en';

    if (kDebugMode) {
      print('current lang code: $languageCode');
    }

    if (langList.isNotEmpty) {
      int index = langList.indexWhere((element) =>
          element.languageCode.toLowerCase() == languageCode.toLowerCase());

      changeSelectedIndex(index);
    }

    isLoading = false;
    update();
  }

  String selectedLangCode = 'en';

  bool isChangeLangLoading = false;


  Future<void> changeLanguage(int index) async {
    try {
      isChangeLangLoading = true;
      update();

      // Get selected language model from the list
      final MyLanguageModel selectedLangModel = langList[index];
      final String languageCode = selectedLangModel.languageCode;

      // Fetch language data from repository
      final ResponseModel response = await repo.getLanguage(languageCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> resJson = jsonDecode(response.responseJson);

        log(resJson.toString());

        // Save language data to shared preferences
        await repo.apiClient.sharedPreferences.setString(
            SharedPreferenceHelper.langListKey, response.responseJson);

        // Set locale and update language controller
        final Locale newLocale = Locale(languageCode);
        final String imagePath =
            "${resJson['data']['image_path']}/${selectedLangModel.imageUrl}";
        await localizationController.setLanguage(newLocale, imagePath);

        // Process translation data from the 'file' field
        final Map<String, dynamic> translationData =
            resJson['data']['file'] ?? {};

        // Convert translation data to required format
        final Map<String, String> translationMap = {};
        translationData.forEach((key, value) {
          translationMap[key] = value.toString();
        });

        // Prepare language map for GetX using the selected language code
        final Map<String, Map<String, String>> languageMap = {
          languageCode: translationMap
        };

        // Clear existing and add new translations
        Get.clearTranslations();
        Get.addTranslations(Messages(languages: languageMap).keys);

        Get.back();
      } else {
        CustomSnackbar.showCustomSnackbar(
            errorList: [response.message], msg: [], isError: true);
      }
    } catch (e) {
      CustomSnackbar.showCustomSnackbar(
          errorList: ['Failed to change language: ${e.toString()}'],
          msg: [],
          isError: true);
      print('Language change error: ${e.toString()}');
    } finally {
      isChangeLangLoading = false;
      update();
    }
  }

  int selectedIndex = 0;
  void changeSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }
}
