import 'package:get/get.dart';
import 'package:simpleapi/service/service.dart';

class CategoryController extends GetxController {
  var category = [].obs;

  Future getCategory() async {
    try {
      var data = await RemoteService.fetchCategory();
      if (data != null) {
        category.value = data;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
  }
}
