import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:play_lab/constants/my_strings.dart';
import 'package:play_lab/core/route/route.dart';
import 'package:play_lab/core/utils/dimensions.dart';
import 'package:play_lab/core/utils/styles.dart';
import 'package:play_lab/view/components/buttons/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/my_color.dart';
import '../../../data/controller/account/profile_controller.dart';
import '../../screens/subscribe_plan/fib_paymentScreen.dart';

showSubscribeDialog(BuildContext context, int itemid, String itemprice,
    {bool fromDetails = false}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    dialogBackgroundColor: MyColor.otpBgColor,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(2),
    ),
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: true,
    onDismissCallback: (type) {},
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          MyStrings.plsSubscribeToWatch.tr,
          textAlign: TextAlign.center,
          style: mulishRegular.copyWith(
              color: MyColor.colorWhite, fontSize: Dimensions.fontLarge),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundedButton(
                width: 0.3,
                vPadding: 5,
                text: '${MyStrings.rent.tr} for ${itemprice} IQD ',
                press: () {
                  Navigator.of(context).pop();
                  String? id =
                      Get.find<ProfileController>().model.data!.user!.id;
                  showFibPaymentBottomSheet(
                    itemid: itemid,
                    isSingleitem: true,
                    context: context,
                    amount: double.parse(itemprice),
                    userId: int.parse(id!),
                  );

                  // print('User ID: $id');

                  // print('Item ID: $itemid');
                  // print('Item Price: $itemprice');
                  // print('Parsed User ID: ${int.parse(id!)}');
                },
                color: MyColor.primaryColor),
            const SizedBox(
              width: 10,
            ),
            RoundedButton(
                width: 0.3,
                vPadding: 5,
                text: MyStrings.subscribe.tr,
                press: () {
                  Get.toNamed(RouteHelper.subscribeScreen);
                },
                color: MyColor.primaryColor),
          ],
        ),
      ],
    ),
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    showCloseIcon: true,
    closeIcon: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: MyColor.colorGrey3.withOpacity(.1)),
      child: const Icon(
        Icons.clear,
        size: 20,
        color: Colors.white,
      ),
    ),
    btnOk: SizedBox.shrink(),
    btnOkOnPress: () {
      Get.toNamed(RouteHelper.subscribeScreen);
    },
  ).show();

  //
}
