import 'package:flutter/material.dart';
import 'package:getx_api/controller/product_controller.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Api Service via GetX Lib")),
      body: Obx(() {
        if (productController.isLoading.isTrue) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 8,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          margin: const EdgeInsets.only(
                              left: 16, top: 8, bottom: 8),
                          child: Image.network(
                            productController.productList[index].imageLink,
                            height: 150,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productController.productList[index].name,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Brand: ${productController.productList[index].brand}",
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Category: ${productController.productList[index].category}",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
