import 'package:get/get.dart';
import 'package:simpleapi/service/service.dart';

import '../model/productdetail.dart';

class ProductDetailController extends GetxController {
  var productdetail = ProductDetail().obs;
  var isLoading = false.obs;

  Future getProductDetail(String id) async {
    try {
      isLoading(true);
      var data = await RemoteService.fecthProductDetail(id);
      if (data != null) {
        productdetail.value = data;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally{
      isLoading(false);
    }
  }
}
