import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpleapi/controller/pdcontroller.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pd = Get.find<ProductDetailController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () {
            if (pd.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network('${pd.productdetail.value.image}'),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
