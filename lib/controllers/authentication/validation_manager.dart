import 'package:get/get.dart';

class ValidationManager extends GetxController {
  validateEmail(String email) {
    if (email.isEmpty) {
    } else if (!email.contains('@')) {
    } else if (email.contains(' ')) {}
  }

  validatePassword(String password) {
    var regExp = RegExp(r'[a-zA-Z0-9]');
    if (password.length < 8) {
    } else if (!regExp.hasMatch(password)) {}
  }
}
