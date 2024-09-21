part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class SelectCheckBoxClicked extends ProductState {
  final List<Product> product;
  final int productIndex;

  SelectCheckBoxClicked({required this.product, required this.productIndex});
}
