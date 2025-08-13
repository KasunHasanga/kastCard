import 'package:flutter_getx_starter/features/card/presentation/controller/card_controller.dart';
import 'package:get/get.dart';

class CardBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CardController>(() => CardController());
  }

}