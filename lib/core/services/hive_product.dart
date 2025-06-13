import 'package:hive_flutter/hive_flutter.dart';

class HiveProduct {
  void insertData({required String name, required String image}) async {
    var box = Hive.box("products");
    Map<String, dynamic> data = {'id': 1, "name": name, "image": image};
    await box.add(data);
  }

  void readAlldata() async {
    var box = Hive.box("products");
    for (var i = 0; i < box.length; i++) {
      print(
        "...............................................${box.get(i)}.................",
      );
    }
  }
}
