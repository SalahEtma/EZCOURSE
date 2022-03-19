import 'package:course_app/controllers/product_controller.dart';
import 'package:course_app/view/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursePage extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  @override
  final int? index;
  MyPaddings myPaddings = MyPaddings();

  CoursePage({Key? key, required this.index}) : super(key: key);
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(productController.productList[index!].name!),
          centerTitle: true,
        ),
        body: Obx(() {
          if (productController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: myPaddings.sidePadding),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8)),
                      margin: EdgeInsets.all(8),
                      width: Get.width,
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productController
                              .productList[index!].name!),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.all(8),
                          width: Get.width,
                          padding: EdgeInsets.all(8),
                          height: 600.0,
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                            return Row(
                              children: [Text('$index')],
                            );
                          }),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            );
        }),
      ),
    );
  }
}
