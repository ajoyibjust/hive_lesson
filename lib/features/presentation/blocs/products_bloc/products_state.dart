import 'package:hive_lesson/core/error/error_model.dart';
import 'package:hive_lesson/features/data/models/products_model.dart';

sealed class ProductsState {}

final class ProductLoadingState extends ProductsState {}

final class ProductsSuccesState extends ProductsState {
  final ProductsModel data;
  ProductsSuccesState({required this.data});
}

final class ProductsFailureState extends ProductsState {
  final ErrorModel error;

  ProductsFailureState({required this.error});
}
