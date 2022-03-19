import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  Future<dynamic> register(String email, String password) async {
    var response = await http.post(
        Uri.parse('http://3.142.29.182/user/Register.php'),
        body: jsonEncode(
            <String, String>{'email': email, 'password': password}));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return response.body;
    }
  }
}
