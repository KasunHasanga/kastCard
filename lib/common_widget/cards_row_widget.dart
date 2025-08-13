import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../config/constants.dart';
import '../config/fonts.dart';

import 'package:get/get.dart';

class CardsRowWidget extends StatelessWidget {
  const CardsRowWidget({
    super.key,
    this.iconData = Icons.person,
    required this.title,
    required this.subTitle,
  });
  final IconData iconData;

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.kAppColor01.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                iconData,
                size: 18,
                color: AppColors.kAppColor01,
              ),
            )),
        SizedBox(
          width: 10,
        ),
        Text(
          title.tr,
          style: AppFonts.styleWithGilroyRegularText(
              color: Theme.of(context).colorScheme.onSurface,
              fSize: FontSizeValue.fontSize14),
        ),
        Spacer(),
        Text(
          subTitle.tr,
          style: AppFonts.styleWithGilroySemiBoldText(
              color: Theme.of(context).colorScheme.onSurface,
              fSize: FontSizeValue.fontSize14),
        ),
      ],
    );
  }
}
