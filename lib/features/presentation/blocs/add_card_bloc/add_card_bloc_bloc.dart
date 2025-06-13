import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_lesson/core/services/hive_product.dart';
import 'package:hive_lesson/features/presentation/blocs/add_card_bloc/add_card_bloc_event.dart';
import 'package:hive_lesson/features/presentation/blocs/add_card_bloc/add_card_bloc_state.dart';

class AddCardBlocBloc extends Bloc<AddCardBlocEvent, AddCardBlocState> {
  final HiveProduct hiveProduct;

  AddCardBlocBloc({required this.hiveProduct}) : super(ProductInitial()) {
    on<LoadProductsEvent>(_onLoadProducts);
    on<AddProductEvent>(_onAddProduct);
  }

  Future<void> _onLoadProducts(
    LoadProductsEvent event,
    Emitter<AddCardBlocState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await hiveProduct.readAlldata();
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  void _onAddProduct(AddProductEvent event, Emitter<AddCardBlocState> emit) {
    try {
      hiveProduct.insertData(name: event.name, image: event.image);
      add(LoadProductsEvent());
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
