import 'package:hive_lesson/core/interceptor/interceptor.dart';
import 'package:hive_lesson/features/data/models/products_model.dart';
import 'package:hive_lesson/features/domain/repository/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final DioClient dio;

  ProductsRepositoryImpl({required this.dio});
  @override
  Future<ProductsModel> fetchProducts() async {
    try {
      final response = await dio.dioClient.get("products");
      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          // print(response.data);
          return ProductsModel.fromMap(response.data);
        }
      }

      throw response.data;
    } catch (e, stack) {
      print(e);
      print(stack);
      rethrow;
    }
  }
}
