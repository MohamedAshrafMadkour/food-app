class Product {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Product({this.name, this.quantity, this.price, this.currency});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json['name'] as String?,
    quantity: json['quantity'] as int?,
    price: json['price'] as String?,
    currency: json['currency'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
