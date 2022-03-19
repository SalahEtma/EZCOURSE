import 'package:course_app/controllers/product_controller.dart';
import 'package:course_app/controllers/search_controller.dart';
import 'package:course_app/view/components/constants.dart';
import 'package:course_app/view/pages/coursepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewBuilder extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  final int? index;
  final String term;

  SearchController searchController = Get.put(SearchController());
  MyPaddings myPaddings = MyPaddings();

  ListViewBuilder({Key? key, required this.index, required this.term})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (searchController.searching == false)
      return GestureDetector(
        onTap: () {
          Get.to(() => CoursePage(
                index: index,
              ));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: myPaddings.sidePadding),
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.network(productController
                            .productList[index!].imageLink!),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productController
                                .productList[index!].name!,
                            style: TextStyle(fontSize: 10),
                          ),
                          Container(
                            child: Text(
                              '\$${productController.productList[index!].price}',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      );
    else
      return GestureDetector(
        onTap: () {
          Get.to(() => CoursePage(
                index: index,
              ));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: myPaddings.sidePadding),
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.network(searchController
                            .searchList[index!].imageLink!),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(searchController
                              .searchList[index!].name!),
                          Container(
                            child: Text(
                                '\$${searchController.searchList[index!].price}'),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      );
  }
  //   else
  //     return Container(
  //       child: Placeholder(),
  //     );
  // }
  // return Container();
}
