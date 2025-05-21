import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String price;

  CartModel({required this.name, required this.price});
}
