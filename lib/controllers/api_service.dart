import 'package:course_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<List<ProductModel>> fetchCourses() async {
    var response = await client.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      late var jsonString = response.body;

      return productModelFromJson(jsonString);
    } else {
      throw -1;
    }
  }
}
