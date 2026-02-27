class ProductModel {
  String titleProduct;
  double priceProduct;
  bool checked;

  ProductModel({
    required this.titleProduct,
    required this.priceProduct,
    this.checked = false,
  });
}
