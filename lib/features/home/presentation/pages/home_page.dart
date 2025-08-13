import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/common_widget/app_button.dart';
import 'package:get/get.dart';

import '../../../../common_widget/accounts_row_widget.dart';

import '../../../../common_widget/cards_row_widget.dart';
import '../../../../config/colors.dart';
import '../../../../config/constants.dart';
import '../../../../config/fonts.dart';
import '../controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/dashboard/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageController homePageController;

  @override
  void initState() {
    if (Get.isRegistered<HomePageController>()) {
      homePageController = Get.find();
    } else {
      homePageController = Get.put(HomePageController());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kAppColor01,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              elevation: 0,
              backgroundColor: AppColors.kAppColor01,
              excludeHeaderSemantics: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person),
                  Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                ],
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: 200,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '18 999.24'.tr,
                          style: AppFonts.styleWithGilroySemiBoldText(
                              color: AppColors.kTextWhite,
                              fSize: FontSizeValue.fontSize20),
                        ),
                        Text(
                          '21'.tr,
                          style: AppFonts.styleWithGilroyRegularText(
                              color: AppColors.kTextWhite,
                              fSize: FontSizeValue.fontSize20),
                        ),
                      ],
                    ),
                    Text(
                      'USD - Dollar'.tr,
                      style: AppFonts.styleWithGilroySemiBoldText(
                          color: AppColors.kTextWhite.withOpacity(0.4),
                          fSize: FontSizeValue.fontSize20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: AppButton(title: "Add Money",action: (){},backgroundColor: AppColors.kAppColor03), ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: AppButton(title: "Exchange",action: (){},backgroundColor: AppColors.kAppColor03),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.kShadowColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                height: Get.height,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Accounts'.tr,
                      style: AppFonts.styleWithGilroySemiBoldText(
                          color: Theme.of(context).colorScheme.onSurface,
                          fSize: FontSizeValue.fontSize16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.kBgColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(children: [
                        AccountsRowWidget(
                            title: '34234234-3423434-343423-4324',
                            iconData: Icons.person,
                            showDropdown: true),
                        AccountsRowWidget(
                            title: '1000 EUR',
                            iconData: Icons.person,
                            showDropdown: false),
                        AccountsRowWidget(
                            title: '34 GDP',
                            iconData: Icons.person,
                            showDropdown: false),
                      ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Cards'.tr,
                      style: AppFonts.styleWithGilroySemiBoldText(
                          color: Theme.of(context).colorScheme.onSurface,
                          fSize: FontSizeValue.fontSize16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.kBgColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      alignment: Alignment.center,
                      child: CardsRowWidget(
                          title: 'EUR *2330',
                          subTitle: '8 199.24 EUR',
                          iconData: Icons.person,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
