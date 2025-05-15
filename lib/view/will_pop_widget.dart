import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_lab/constants/my_strings.dart';
import 'package:play_lab/view/components/dialog/app_dialog.dart';
import 'package:play_lab/view/components/dialog/exit_dialog.dart';

class WillPopWidget extends StatelessWidget {
  final Widget child;
  final String nextRoute;

  const WillPopWidget({
    Key? key,
    required this.child,
    this.nextRoute = ''
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          if (nextRoute == 'closeParty') {
            AppDialog().closePartyDialog(
              context,
              msgText: MyStrings.closePartyMsg.tr,
              () {
                Get.offAndToNamed(nextRoute);
              }
            );
          } else if (nextRoute.isEmpty) {
            showExitDialog(context);
          } else {
            Get.offAndToNamed(nextRoute);
          }
        },
        child: child);
  }
}
