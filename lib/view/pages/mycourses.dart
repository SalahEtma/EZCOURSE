import 'package:course_app/controllers/product_controller.dart';
import 'package:course_app/view/components/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCourses extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Courses'),
          centerTitle: true,
        ),
        body: Obx(() {
          if (productController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView.builder(
                cacheExtent: 3,
                itemExtent: 100,
                itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        // Expanded(
                        //   child: Image.network(productController
                        //       .productList[index].imageLink!),
                        // ),
                        Expanded(
                            child: Text(productController
                                .productList[index].name!))
                      ],
                    ),
                  );
                });
        }),
      ),
    );
  }
}
