import 'package:hive_flutter/hive_flutter.dart';

class HiveProduct {
  void insertData({required String name, required String image}) async {
    var box = Hive.box("products");
    Map<String, dynamic> data = {'id': 1, "name": name, "image": image};
    await box.add(data);
  }

   Future<List<Map<String, dynamic>>> readAlldata() async {
     List<Map<String, dynamic>> localProducts = [];
    var box =  Hive.box("products");
    for (var i = 0; i < box.length; i++) {
      final product = box.getAt(i);
      if (product != null && product is Map<String, dynamic>) {
        localProducts.add(product);
      }
    }
    return localProducts;
  }
}
