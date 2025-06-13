abstract class AddCardBlocState {}

class ProductInitial extends AddCardBlocState {}

class ProductLoading extends AddCardBlocState {}

class ProductLoaded extends AddCardBlocState {
  final List<Map<String, dynamic>> products;

  ProductLoaded({required this.products});
}

class ProductError extends AddCardBlocState {
  final String message;

  ProductError({required this.message});
}
