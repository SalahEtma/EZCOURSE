import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  late PageController pageController;
  var currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(currentIndex.value);
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
