part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class SaveProduct extends ProductEvent {}

final class EditPrice extends ProductEvent {}

final class SelectCheckBoxEvent extends ProductEvent {
  final List<Product> product;
  final int productIndex;

  SelectCheckBoxEvent( {required this.product, required this.productIndex});
}
