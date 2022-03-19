// ignore_for_file: prefer_const_constructors

import 'package:course_app/controllers/navbar_controller.dart';
import 'package:course_app/view/components/bottom_navbar_item.dart';
import 'package:course_app/view/pages/explore.dart';
import 'package:course_app/view/pages/mycourses.dart';
import 'package:course_app/view/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  NavBarController navBarController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: SizedBox.expand(
            child: PageView(
          physics:
              ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          children: [Explore(), MyCourses(), Profile()],
          controller: navBarController.pageController,
        )),
      ),
    );
  }
}
