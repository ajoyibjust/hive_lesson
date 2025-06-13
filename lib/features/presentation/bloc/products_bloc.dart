
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_lesson/core/error/error_model.dart';
import 'package:hive_lesson/features/data/repository/products_repository_impl.dart';
import 'package:hive_lesson/features/presentation/bloc/products_event.dart';
import 'package:hive_lesson/features/presentation/bloc/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepositoryImpl impl;
  ProductsBloc(this.impl) : super(ProductLoadingState()) {
    on<ProductsFetchEvent>(_productsFetchEvent);
  }

  _productsFetchEvent(event, emit) async {
    try {
      emit(ProductLoadingState());
      final request = await impl.fetchProducts();
      emit(ProductsSuccesState(data: request));
    } catch (e) {
      emit(ProductsFailureState(error: ErrorModel(error: e.toString())));
    }
  }
}
