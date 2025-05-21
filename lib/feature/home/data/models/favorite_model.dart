import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 1)
class FavoriteModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String price;

  FavoriteModel({required this.name, required this.price});
}
