import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/feature/Best%20Selling/presentation/views/widgets/the_best_selling_fruit.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key, required this.productEntity});
  final List<ProductEntity> productEntity;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: productEntity.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return TheBestSellingFruit(productEntity: productEntity[index]);
      },
    );
  }
}
