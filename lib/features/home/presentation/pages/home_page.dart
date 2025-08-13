import 'package:cached_network_image/cached_network_image.dart';
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.kAppColor01,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(shape:
                      BoxShape.circle),
                      child:  CachedNetworkImage(
                    imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search_rounded,
                    color: AppColors.kTextWhite
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
                        Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '\$',
                              style: AppFonts.styleWithGilroyRegularText(
                                  color: AppColors.kTextWhite,
                                  fSize: FontSizeValue.fontSize11),
                            ),
                            SizedBox(width: 3,),
                            Text(
                              '18 999.24'.tr,
                              style: AppFonts.styleWithGilroySemiBoldText(
                                  color: AppColors.kTextWhite,
                                  fSize: FontSizeValue.fontSize20),
                            ),
                          ],
                        ), Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '\£',
                              style: AppFonts.styleWithGilroyRegularText(
                                  color: AppColors.kTextWhite,
                                  fSize: FontSizeValue.fontSize11),
                            ),
                            SizedBox(width: 3,),
                        Text(
                          '21'.tr,
                          style: AppFonts.styleWithGilroyRegularText(
                              color: AppColors.kTextWhite,
                              fSize: FontSizeValue.fontSize20),
                        )],),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            'USD - Dollar'.tr,
                            textAlign: TextAlign.start,
                            style: AppFonts.styleWithGilroySemiBoldText(
                                color: AppColors.kTextWhite.withOpacity(0.4),
                                fSize: FontSizeValue.fontSize14),
                          ),
                        ),
                      ],
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
                  color: AppColors.kBgColor,
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
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: AppColors.kTextWhite,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(children: [
                        AccountsRowWidget(
                            title: '34234234-3423434-343423-4324',
                            iconData: Icons.account_balance_wallet_outlined,
                            showDropdown: true,bold: false,),
                        AccountsRowWidget(
                            title: '1000 EUR',
                            iconData: Icons.euro,
                            showDropdown: false,bold: true,),
                        AccountsRowWidget(
                            title: '34 GBP',
                            iconData: Icons.currency_pound,
                            showDropdown: false,bold: true),
                      ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cards'.tr,
                          style: AppFonts.styleWithGilroySemiBoldText(
                              color: Theme.of(context).colorScheme.onSurface,
                              fSize: FontSizeValue.fontSize16),
                        ),

                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.kAppColor03.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Icon(Icons.add,size: 11,color: AppColors.kAppColor03,),
                              SizedBox(width: 3,),
                              Text(
                                'ADD CARDS'.tr,
                                style: AppFonts.styleWithGilroySemiBoldText(
                                    color: AppColors.kAppColor03,
                                    fSize: FontSizeValue.fontSize9),
                              ),

                            ],
                          )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: AppColors.kTextWhite,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      alignment: Alignment.center,
                      child: CardsRowWidget(
                          title: 'EUR *2330',
                          subTitle: '8 199.24 EUR',
                          iconData: Icons.wallet_outlined,
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
