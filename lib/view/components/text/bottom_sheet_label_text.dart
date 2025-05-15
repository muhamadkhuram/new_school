import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_lab/core/utils/my_color.dart';
import 'package:play_lab/core/utils/styles.dart';

class BottomSheetLabelText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  const BottomSheetLabelText({Key? key, required this.text, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.tr, textAlign: textAlign, style: mulishRegular.copyWith(color: MyColor.bodyTextColor, fontWeight: FontWeight.w500));
  }
}
