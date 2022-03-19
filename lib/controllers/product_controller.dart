import 'package:course_app/controllers/api_service.dart';
import 'package:course_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var allLoaded = false.obs;
  var loadedItems = 10.obs;
  var productList = <ProductModel>[].obs;
  var products = <ProductModel>[];
  ScrollController scrollController = ScrollController();
  var currentMax = 10.obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      products = await ApiService.fetchCourses();
      productList.assignAll(products.getRange(0, loadedItems.value));
    } finally {
      isLoading(false);
    }
  }
}
