import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../config/constants.dart';
import '../config/fonts.dart';

import 'package:get/get.dart';

class CardOperationRowWidget extends StatelessWidget {
  const CardOperationRowWidget({
    super.key,
    this.iconData = Icons.person,

    required this.title,
  });
  final IconData iconData;


  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.kTextWhite,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),

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
            style: AppFonts.styleWithGilroySemiBoldText(
                color: Theme.of(context).colorScheme.onSurface,
                fSize: FontSizeValue.fontSize13),
          ),

        ],
      ),
    );
  }
}
