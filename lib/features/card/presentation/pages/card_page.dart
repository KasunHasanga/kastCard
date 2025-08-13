import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widget/card_operation_row_widget.dart';
import '../../../../config/colors.dart';
import '../../../../config/constants.dart';
import '../../../../config/fonts.dart';
import '../controller/card_controller.dart';

class CardPage extends StatefulWidget {
  static const routeName = '/card';
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  late CardController cardController;
  bool isLightModeSelected = false;
  bool isAuto = false;

  @override
  void initState() {
    if (Get.isRegistered<CardController>()) {
      cardController = Get.find();
    } else {
      cardController = Get.put(CardController());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBgColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              elevation: 0,
              actions: [
                Icon(Icons.more_vert_sharp),
                SizedBox(
                  width: 20,
                )
              ],
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              backgroundColor: AppColors.kBgColor,
              excludeHeaderSemantics: true,
              centerTitle: true,
              title: Text(
                'Card'.tr,
                style: AppFonts.styleWithGilroySemiBoldText(
                    color: Theme.of(context).colorScheme.onSurface,
                    fSize: FontSizeValue.fontSize16),
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$',
                      style: AppFonts.styleWithGilroyBoldText(
                          color: AppColors.kBlack,
                          fSize: FontSizeValue.fontSize11),
                    ),

                    Text(
                      ' 18 999.24'.tr,
                      style: AppFonts.styleWithGilroyBoldText(
                          color: AppColors.kBlack,
                          fSize: FontSizeValue.fontSize20),
                    ),
                  ]),

              SizedBox(
                height: 15,
              ),

              CreditCardWidget(
                cardNumber: "5436 5436 **** 6643",
                expiryDate: "08/28",
                cardHolderName: "Kasun Hasanga",
                cvvCode: "343",
                showBackView: false,
                onCreditCardWidgetChange: (CreditCardBrand brand) {},
                cardBgColor: AppColors.kAppColor01,
                obscureCardNumber: true,
                obscureInitialCardNumber: false,
                obscureCardCvv: true,
                labelCardHolder: 'CARD HOLDER',
                cardType: CardType.mastercard,
                height: 175,
                textStyle: AppFonts.styleWithGilroyRegularText(
                    color: AppColors.kTextWhite,
                    fSize: FontSizeValue.fontSize11),
                width: MediaQuery.of(context).size.width,
                isChipVisible: true,
                isSwipeGestureEnabled: false,
                frontCardBorder: Border.all(color: Colors.grey),
                chipColor: Colors.white,
                padding: 20,
              ),

              ///need page view
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(children: [
                  CardOperationRowWidget(
                    title: 'Top up Card',
                    iconData: Icons.credit_card,
                  ),
                  CardOperationRowWidget(
                    title: 'Payments',
                    iconData: Icons.account_balance_wallet_outlined,
                  ),
                  CardOperationRowWidget(
                    title: 'Card Outlet',
                    iconData: Icons.arrow_right_alt_outlined,
                  ),
                  CardOperationRowWidget(
                    title: 'Take all the money from card',
                    iconData: Icons.credit_card,
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
