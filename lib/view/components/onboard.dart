import 'package:course_app/controllers/authentication_manager.dart';
import 'package:course_app/view/pages/deletelater_login.dart';
import 'package:course_app/view/pages/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value
          ? LandingPage()
          : LoginScreen();
    });
  }
}
