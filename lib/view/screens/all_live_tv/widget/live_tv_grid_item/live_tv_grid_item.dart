import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:play_lab/core/utils/my_images.dart';
import '../../../../../core/utils/my_color.dart';
import '../../../bottom_nav_pages/home/widget/custom_network_image/custom_network_image.dart';

class LiveTvGridItem extends StatelessWidget {
  final String liveTvName;
  final String imageUrl;
  final Callback press;
  final Color textColor;
  final Color bgColor;
  final Color? borderColor;

  final double marginLeft;

  LiveTvGridItem({
    Key? key,
    this.bgColor = MyColor.textFieldColor,
    this.textColor = MyColor.colorWhite,
    required this.liveTvName,
    required this.imageUrl,
    required this.press,
    this.borderColor,
    this.marginLeft = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: borderColor ?? Colors.grey.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.only(left: marginLeft),
      child: GestureDetector(
          onTap: press,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 60, minHeight: 50),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CustomNetworkImage(
                  imageUrl: imageUrl,
                  boxFit: BoxFit.cover,
                  height: 30,
                  width: 30,
                )),
          )),
    );
  }
}

class AllLiveTvGridItem extends StatelessWidget {
  final String liveTvName;
  final String imageUrl;
  final Callback press;
  final Color textColor;
  final Color bgColor;
  final double marginLeft;

  const AllLiveTvGridItem({
    Key? key,
    this.bgColor = MyColor.textFieldColor,
    this.textColor = MyColor.colorWhite,
    required this.liveTvName,
    required this.imageUrl,
    required this.press,
    this.marginLeft = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft, bottom: 8),
      child: GestureDetector(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: CustomNetworkImage(
                  imageUrl: imageUrl,
                  height: 100,
                  width: double.infinity,
                  boxFit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
