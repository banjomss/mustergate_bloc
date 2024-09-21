import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustergate_bloc/bloc/product_bloc.dart';
import 'package:mustergate_bloc/model/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Checkbox App',
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: ProductList(),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(
        name: 'Product 1',
        comment: "",
        price: 0.00,
        totalPrice: 0.00,
        isChecked: false),
    Product(
        name: 'Product 2',
        comment: "",
        price: 0.00,
        totalPrice: 0.00,
        isChecked: false),
    Product(
        name: 'Product 3',
        comment: "",
        price: 0.00,
        totalPrice: 0.00,
        isChecked: false),
  ];

  final TextEditingController _commentController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  double totalPrice = 0.00;

  // double _calculateTotalPrice() {
  //   double total = 0.0;
  //   for (var product in products) {
  //     if (product.priceController.text.isNotEmpty) {
  //       total += double.tryParse(product.priceController.text) ?? 0.0;
  //     }
  //   }
  //   return total;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Textbox for user input
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Enter your comment',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // List of products with checkboxes and price textboxes
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is SelectCheckBoxClicked) {
                  List<Product> product = state.product;
                  var productIndex = state.productIndex;
                  products = product;
                  totalPrice = product[productIndex].totalPrice;
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CheckboxListTile(
                                      title: Text(products[index].name),
                                      value: products[index].isChecked,
                                      onChanged: (bool? value) {
                                        bool ischecked = products[index]
                                            .isChecked = value ?? false;
                                        BlocProvider.of<ProductBloc>(context)
                                            .add(SelectCheckBoxEvent(
                                                product: products,
                                                productIndex: index));
                                        // setState(() {
                                        //   products[index].isChecked =
                                        //       value ?? false;
                                        // });
                                      },
                                    ),
                                    // TextField(
                                    //   controller: priceController,
                                    //   decoration: InputDecoration(
                                    //     labelText: 'Price',
                                    //     border: OutlineInputBorder(),
                                    //   ),
                                    //   keyboardType: TextInputType.number,
                                    //   onChanged: (value) {
                                    //     // setState(
                                    //     //     () {}); // Trigger rebuild on price change
                                    //   },
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            // Display total price
            Text(
              'Total Price: $totalPrice',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// class Products {
//   final String name;
//   bool isChecked;
//   TextEditingController priceController;

//   Products({required this.name, this.isChecked = false})
//       : priceController = TextEditingController();
// }
