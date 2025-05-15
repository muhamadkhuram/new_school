import 'dart:convert';
import 'package:get/get.dart';
import 'package:play_lab/data/repo/live_tv_repo/live_tv_repo.dart';
import '../../model/global/response_model/response_model.dart';
import '../../model/live_tv/category_model.dart';
import '../../model/live_tv/live_tv_response_model.dart';

class LiveTvController extends GetxController implements GetxService {
  LiveTvRepo repo;
  LiveTvController({required this.repo});
  String selectedCategory = 'All'; // Default

  bool isLoading = true;
  bool isPaginating = false; // ✅ NEW FLAG
  List<MainTelevisionModel> televisionList = [];
  String televisionImagePath = '';
  int page = 0;
  String? nextPageUrl;
  List<String> tvcategories = [];
  List<MainTelevisionModel> getFilteredList() {
    if (selectedCategory == 'All') return televisionList;

    return televisionList
        .where((tv) =>
            tv.category != null && tv.category!.name == selectedCategory)
        .toList();
  }

  void getLiveTv() async {
    clearAllData();
    page = 1;
    updateLoadingStatus(true);
    ResponseModel model = await repo.getLiveTv(page);
    if (model.statusCode == 200) {
      LiveTvResponseModel televisionModel =
          LiveTvResponseModel.fromJson(jsonDecode(model.responseJson));
      nextPageUrl = televisionModel.data?.televisions?.nextPageUrl ?? '';
      if (televisionModel.data != null) {
        final tvDataList = televisionModel.data!.televisions?.data;
        if (tvDataList != null && tvDataList.isNotEmpty) {
          televisionList.clear();
          //  tvcategories.clear();
          televisionList.addAll(tvDataList);
          televisionImagePath = televisionModel.data?.imagePath ?? '';
          //tvcategories.add('All');
        }
      }
    }
    updateLoadingStatus(false);
    String? url = nextPageUrl;
    while (url != null && url.isNotEmpty) {
      await getPaginateTV();
      url = nextPageUrl; // Update after the fetch
    }
  }

  void getLiveTvcategories() async {
    // updateLoadingStatus(true);
    ResponseModel model = await repo.getLiveTvcategories();
    if (model.statusCode == 200) {
      TvCategories televisionCatModel =
          TvCategories.fromJson(jsonDecode(model.responseJson));
      if (televisionCatModel.categories != null) {
        final tvCatList = televisionCatModel.categories!;
        tvcategories.clear();
        tvcategories.add("All");
        for (var cat in tvCatList) {
          final category = cat;

          tvcategories.add(category);
          //
        }
      }
    }
    // updateLoadingStatus(false);
    print(tvcategories.toString());
  }

  getPaginateTV() async {
    if (isPaginating || !hasNext()) return; // ✅ Prevent duplicate calls

    isPaginating = true;
    update();

    page = page + 1;
    ResponseModel model = await repo.getLiveTv(page);

    if (model.statusCode == 200) {
      LiveTvResponseModel televisionModel =
          LiveTvResponseModel.fromJson(jsonDecode(model.responseJson));
      nextPageUrl = televisionModel.data?.televisions?.nextPageUrl ?? '';

      final newData = televisionModel.data?.televisions?.data;
      if (newData != null && newData.isNotEmpty) {
        televisionList.addAll(newData);
        televisionImagePath = televisionModel.data?.imagePath ?? '';
      } else {
        // If no data returned, consider it's the last page
        nextPageUrl = null;
      }
    }

    isPaginating = false;
    update();
  }

  bool hasNext() {
    return nextPageUrl != null &&
        nextPageUrl!.isNotEmpty &&
        nextPageUrl != 'null';
  }

  void clearAllData() {
    page = 0;
    isLoading = true;
    isPaginating = false;
    nextPageUrl = null;
    televisionList.clear();
  }

  void updateLoadingStatus(bool status) {
    isLoading = status;
    update();
  }
}
