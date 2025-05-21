import 'item.dart';

class OrdersList {
  List<Product>? items;

  OrdersList({this.items});

  factory OrdersList.fromJson(Map<String, dynamic> json) => OrdersList(
    items:
        (json['items'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
