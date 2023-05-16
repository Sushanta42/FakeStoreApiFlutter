import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/category.dart';
import '../model/product.dart';
import '../model/productdetail.dart';

class RemoteService {
  static String baseUrl = 'https://fakestoreapi.com';
  static var headers = {'Accept': 'application/json'};

  static Future<List<Product?>?> fetchData() async {
    try {
      var response =
          await http.get(Uri.parse('$baseUrl/products'), headers: headers);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  static Future<List<String?>?> fetchCategory() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/products/categories'),
          headers: headers);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return categoryFromJson(jsonString);
      } else {
        null;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  static Future<ProductDetail?> fecthProductDetail(String id) async {
    try {
      var response =
          await http.get(Uri.parse('$baseUrl/products/$id'), headers: headers);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productDetailFromJson(jsonString);
      } else {
        null;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
