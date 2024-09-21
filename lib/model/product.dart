class Product {
  final String name;
  bool isChecked;
  String comment;
  double price;
  double totalPrice;

  Product(
      {required this.name,
      this.isChecked = false,
      required this.comment,
      required this.price,
      required this.totalPrice});
}
