import 'package:course_app/controllers/api_service.dart';
import 'package:course_app/controllers/product_controller.dart';
import 'package:course_app/models/product_model.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  ProductController productController = Get.put(ProductController());

  static const historyLength = 5;
  var searchHistory = <String?>[].obs;
  var filteredSearchHistory = <String?>[].obs;
  Rxn<String> selectedTerm = Rxn<String>();
  var searchList = <ProductModel>[];
  var nameLower, searchLower;
  RxBool searching = false.obs;
  List<String?>? filterSearchTerms({required String? filter}) {
    if (filter != null && filter.isNotEmpty) {
      return searchHistory.reversed
          .where((term) => term!.startsWith(filter))
          .toList();
    } else
      return searchHistory.reversed.toList();
  }

  void addSearchTerm(String term) {
    if (searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }
    searchHistory.add(term);
    if (searchHistory.length > historyLength) {
      searchHistory.removeRange(
          0, searchHistory.length - historyLength);
    }
    filteredSearchHistory.value = filterSearchTerms(filter: null)!;
  }

  void deleteSearchTerm(String term) {
    searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory.value = filterSearchTerms(filter: null)!;
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  void searchResults(String term) {
    searchList = productController.productList.where((u) {
      final nameLower = u.name!.toLowerCase();
      final searchLower = term.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();
  }

  @override
  void onInit() {
    filteredSearchHistory.value = filterSearchTerms(filter: null)!;

    super.onInit();
  }
}
