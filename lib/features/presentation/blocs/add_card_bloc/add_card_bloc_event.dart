abstract class AddCardBlocEvent {}

class LoadProductsEvent extends AddCardBlocEvent {}

class AddProductEvent extends AddCardBlocEvent {
  final String name;
  final String image;

  AddProductEvent({required this.name, required this.image});
}