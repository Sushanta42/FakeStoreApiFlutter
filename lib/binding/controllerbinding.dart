import 'package:get/get.dart';
import 'package:simpleapi/controller/pdcontroller.dart';
import 'package:simpleapi/controller/productcontroller.dart';

import '../controller/categorycontroller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductController());
    Get.put(CategoryController());
    Get.put(ProductDetailController());
  }
}
