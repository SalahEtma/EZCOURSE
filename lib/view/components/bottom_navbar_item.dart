import 'package:course_app/controllers/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  // var currentIndex = 0.obs;
  NavBarController navBarController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: navBarController.currentIndex.value,
        elevation: 0.5,
        backgroundColor: Colors.white,
        onTap: (index) {
          navBarController.changeTabIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Explore',
            activeIcon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'My Courses',
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
