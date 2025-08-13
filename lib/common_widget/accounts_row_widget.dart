import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../config/constants.dart';
import '../config/fonts.dart';

import 'package:get/get.dart';

class AccountsRowWidget extends StatelessWidget {
  const AccountsRowWidget({
    super.key,
    this.iconData = Icons.person,
    this.showDropdown = false,
    required this.title,
    required this.bold,
  });
  final IconData iconData;

  final bool showDropdown;
  final String title;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.kAppColor03.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  iconData,
                  size: 18,
                  color: AppColors.kAppColor03,
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Text(
            title.tr,
            style:bold? AppFonts.styleWithGilroySemiBoldText(
                color: Theme.of(context).colorScheme.onSurface,
                fSize: FontSizeValue.fontSize14):AppFonts.styleWithGilroyRegularText(
                color: Theme.of(context).colorScheme.onSurface,
                fSize: FontSizeValue.fontSize14),
          ),
          Spacer(),
          showDropdown
              ? Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.kAppColor01,
                )
              : Container()
        ],
      ),
    );
  }
}
