import 'package:fruits_hub/core/entities/product_entity.dart';

class CartEntity {
  final ProductEntity product;
  int count;

  CartEntity({required this.product, this.count = 0});
}
