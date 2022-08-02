import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentOffer = 2.obs;

  int get currentOfferValue => currentOffer.value;
  void setCurrentOffer(int value) {
    currentOffer.value = value;
  }
}
