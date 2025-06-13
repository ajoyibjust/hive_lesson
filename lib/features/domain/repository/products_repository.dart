import 'package:hive_lesson/features/data/models/products_model.dart';

abstract class ProductsRepository {
  Future<ProductsModel> fetchProducts();
}
