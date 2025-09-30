import 'package:flutter/material.dart';

import 'food_item_card.dart';

class FoodItemCardListView extends StatelessWidget {
  const FoodItemCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return FoodItemCard(
          name: 'تفاح',
          weight: '1 كجم',
          price: 22,
          imageUrl: '',
        );
      },
    );
  }
}
