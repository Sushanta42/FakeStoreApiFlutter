import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:simpleapi/controller/categorycontroller.dart';
import 'package:simpleapi/controller/pdcontroller.dart';
import 'package:simpleapi/controller/productcontroller.dart';
import 'package:simpleapi/view/productdetail.dart';

import '../widgets/bold.dart';
import '../widgets/vgap.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nc = Get.find<ProductController>();
    var cc = Get.find<CategoryController>();
    var pd = Get.find<ProductDetailController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () {
            if (nc.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const BoldText(title: 'Categories'),
                    SizedBox(
                      height: 30,
                      width: Get.size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cc.category.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Chip(
                                label: Text('${cc.category[index]}'),
                                backgroundColor: Colors.amberAccent,
                              ),
                            );
                          }),
                    ),
                    const VGap(),
                    const BoldText(title: 'Featured Products'),
                    allProduct(nc, pd),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  GridView allProduct(ProductController nc, ProductDetailController pd) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: nc.product.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            pd.getProductDetail(nc.product[index].id.toString()).whenComplete(
                  () => Get.to(() => const ProductDetailView()),
                );
          },
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: "${nc.product[index].image}",
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${nc.product[index].title}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('\$${nc.product[index].price}'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar.builder(
                    initialRating:
                        double.parse(nc.product[index].rating.rate.toString()),
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemSize: 18,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
