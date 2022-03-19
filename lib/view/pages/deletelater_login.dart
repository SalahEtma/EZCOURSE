import 'package:course_app/view/pages/landingpage.dart';
import 'package:course_app/view/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  var users = {
    'dribbble@gmail.com': '12345',
    '1@gmail.com': 'seveen',
  };
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User does not exist';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint(
        'Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User does not exist';
      }
      return 'null';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        theme: LoginTheme(
          pageColorLight: Colors.pink[200],
          pageColorDark: Colors.pinkAccent,
          primaryColor: Colors.pinkAccent,
          inputTheme: InputDecorationTheme(
            fillColor: Colors.pink[50],
            filled: true,

            // prefixIconColor: Colors.purpleAccent,
            // suffixIconColor: Colors.purpleAccent,
            // focusColor: Colors.purple,
            // iconColor: Colors.purple
          ),
        ),
        title: 'EZ-COURSE',
        onLogin: _authUser,
        onSignup: _signupUser,
        onSubmitAnimationCompleted: () {
          Get.off(() => LandingPage());
        },
        onRecoverPassword: _recoverPassword,
      ),
    );
  }
}
