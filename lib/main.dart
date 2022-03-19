import 'package:course_app/controllers/authentication/authentication_controller.dart';
import 'package:course_app/controllers/authentication/authentication_state.dart';
import 'package:course_app/view/components/bottombar.dart';
import 'package:course_app/view/pages/deletelater_login.dart';
import 'package:course_app/view/pages/explore.dart';
import 'package:course_app/view/pages/landingpage.dart';
import 'package:course_app/view/pages/login.dart';
import 'package:course_app/view/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Authentication Manager',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashView(),
    );
  }
}
