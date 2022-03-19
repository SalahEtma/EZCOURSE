import 'package:course_app/controllers/product_controller.dart';
import 'package:course_app/controllers/search_controller.dart';
import 'package:course_app/view/components/constants.dart';
import 'package:course_app/view/components/listview_builder.dart';
import 'package:course_app/view/components/modal_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Explore extends StatelessWidget {
  var currentIndex = 0.obs;

  FloatingSearchBarController fsbController =
      FloatingSearchBarController();
  SearchController searchController = Get.put(SearchController());
  ProductController productController = Get.put(ProductController());
  MyStyles mStyles = MyStyles();

  String searchBarTitle = 'Search';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Explore'),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    context: context,
                    builder: (context) => ModalBottomSheet(),
                  );
                },
                icon: Icon(Icons.add))
          ],
          centerTitle: true,
        ),
        body: Obx(() {
          if (productController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return FloatingSearchBar(
              borderRadius:
                  BorderRadius.circular(mStyles.circularBorderRadius),
              controller: fsbController,
              physics: BouncingScrollPhysics(),
              transition: CircularFloatingSearchBarTransition(),
              title: Text(
                searchController.selectedTerm.value ?? searchBarTitle,
                style: Theme.of(context).textTheme.headline6,
              ),
              hint: 'Search Course name...',
              actions: [FloatingSearchBarAction.searchToClear()],
              onQueryChanged: (query) {
                searchController.filteredSearchHistory.value =
                    searchController.filterSearchTerms(
                        filter: query)!;
              },
              onSubmitted: (query) {
                searchController.addSearchTerm(query);
                searchController.selectedTerm.value = query;
                searchController.searchResults(query);
                searchController.searching.value = true;
                fsbController.close();
              },
              builder: (context, transition) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(
                      mStyles.circularBorderRadius),
                  child: Material(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Builder(
                      builder: (context) {
                        if (searchController
                                .filteredSearchHistory.isEmpty &&
                            fsbController.query.isEmpty) {
                          return Container(
                            height: 56,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              'No recents...',
                              maxLines: 1,
                              style:
                                  Theme.of(context).textTheme.caption,
                            ),
                          );
                        } else if (searchController
                            .filteredSearchHistory.isEmpty) {
                          return ListTile(
                            title: Text(fsbController.query),
                            leading: const Icon(Icons.search),
                            onTap: () {
                              searchController
                                  .addSearchTerm(fsbController.query);
                              searchController.selectedTerm.value =
                                  fsbController.query;
                              fsbController.close();
                            },
                          );
                        } else
                          return Obx(
                            () => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: searchController
                                  .filteredSearchHistory
                                  .map(
                                    (term) => ListTile(
                                      title: Text(
                                        term!,
                                        maxLines: 1,
                                        overflow:
                                            TextOverflow.ellipsis,
                                      ),
                                      leading:
                                          const Icon(Icons.history),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.clear),
                                        onPressed: () {
                                          searchController
                                              .deleteSearchTerm(term);
                                        },
                                      ),
                                      onTap: () {
                                        searchController
                                            .putSearchTermFirst(term);
                                        searchController.selectedTerm
                                            .value = term;

                                        fsbController.close();
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                      },
                    ),
                  ),
                );
              },
              elevation: 1,
              body: FloatingSearchBarScrollNotifier(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: Get.height / 12),
                    cacheExtent: 11,
                    itemExtent: 100,
                    itemCount: ifZero(),
                    itemBuilder: (context, index) {
                      return ListViewBuilder(
                        term: fsbController.query,
                        index: index,
                      );
                    }),
              ),
            );
        }),
      ),
    );
  }

  ifZero() {
    if (searchController.searching == false) {
      return productController.productList.length;
    } else
      return searchController.searchList.length;
  }
}


// GetMaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Explore'),
//         ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: const [
//                 CustomFormField(
//                   hint: 'Search...',
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );