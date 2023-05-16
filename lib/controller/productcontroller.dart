import 'package:get/get.dart';
import 'package:simpleapi/service/service.dart';

class ProductController extends GetxController {
  var product = [].obs;
  var isLoading = false.obs;

  Future getProduct() async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchData();
      if (data != null) {
        product.value = data;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProduct();
  }
}
