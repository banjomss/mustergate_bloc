import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mustergate_bloc/model/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SelectCheckBoxEvent>((event, emit) {
      List<Product> product = event.product;
      int productIndex = event.productIndex;
      double totalPrice = product[productIndex].totalPrice;
      print("==================");
      print(product[productIndex].isChecked);
      print(product[productIndex].name);
      print(productIndex);
      print("==================");
      emit(SelectCheckBoxClicked(product: product, productIndex: productIndex));
      // TODO: implement event handler
    });
  }
}
