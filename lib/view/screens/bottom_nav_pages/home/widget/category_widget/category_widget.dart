import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants/my_strings.dart';
import '../../../../../../core/route/route.dart';
import '../../../../../../core/utils/my_color.dart';
import '../../../../../components/bottom_Nav/bottom_nav.dart';
import '../../../../../components/nav_drawer/custom_nav_drawer.dart';
import '../../../../../components/show_more_row/show_more_row.dart';
import '../../../../sub_category/sub_category_screen.dart';
import '../../.././../../../core/utils/dimensions.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../data/controller/category/category_controller/category_controller.dart';
import '../../../all_movies/all_movies_screen.dart';
import '../../../all_movies/widget/all_movie_list_item.dart';
import '../../shimmer/category_shimmer.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        backgroundColor: MyColor.colorBlack,
        body: GetBuilder<CategoryController>(
            builder: (controller) => controller.isLoading
                ? const SizedBox(height: 50, child: CategoryShimmer())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                            height: Dimensions.spaceBetweenCategory + 5),
                        ShowMoreText(
                            headerText: MyStrings.category,
                            isShowMoreVisible: false,
                            press: () {}),
                        const SizedBox(
                            height: Dimensions.spaceBetweenCategory + 5),
                        Row(children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.cornerRadius),
                              color: MyColor.primaryColor,
                              // border: Border.all(color: Colors.white30,width: 1),
                            ),
                            child: Text(
                              'All',
                              style: mulishSemiBold.copyWith(color: MyColor.t2),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              //  width: Get.width * 1,
                              height: Get.height * 0.05,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  itemCount: controller.categoryList.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              RouteHelper.subCategoryScreen,
                                              arguments: [
                                                controller
                                                    .categoryList[index].id,
                                                controller.categoryList[index]
                                                        .name ??
                                                    ''
                                              ]);
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          padding: const EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.cornerRadius),
                                            color: MyColor.t4,
                                            // border: Border.all(color: Colors.white30,width: 1),
                                          ),
                                          child: Text(
                                            controller.categoryList[index].name
                                                    ?.tr ??
                                                '',
                                            style: mulishSemiBold.copyWith(
                                                color: MyColor.t2),
                                          ),
                                        ),
                                      )),
                            ),
                          )
                        ]),
                        SingleChildScrollView(child: AllMovieListWidget())
                      ],
                    ),
                  )),
        bottomNavigationBar: const CustomBottomNav(
          currentIndex: 3,
        ),
      ),
    );
  }
}
