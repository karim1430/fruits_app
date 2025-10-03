import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/feature/shopping/domain/entities/cart_entity.dart';
import 'package:fruits_hub/feature/shopping/presentation/manager/cubit/shopping_cart_cubit.dart';
import 'food_item_card.dart';

class FoodItemCardListView extends StatefulWidget {
  const FoodItemCardListView({super.key});

  @override
  State<FoodItemCardListView> createState() => _FoodItemCardListViewState();
}

class _FoodItemCardListViewState extends State<FoodItemCardListView> {
  List<CartEntity> cartEntities = [];

  @override
  void initState() {
    super.initState();
    // تهيئة البيانات الأولية
    cartEntities = context.read<ShoppingCartCubit>().cartItems;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCartCubit, ShoppingCartState>(
      listener: (context, state) {
        setState(() {
          cartEntities = context.read<ShoppingCartCubit>().cartItems;
        });
      },
      builder: (context, state) {
        if (cartEntities.isEmpty) {
          return const Center(child: Text('لا توجد منتجات في السلة'));
        }

        return ListView.builder(
          itemCount: cartEntities.length,
          itemBuilder: (context, index) {
            log('Loading item: ${cartEntities[index].product.name}');
            return FoodItemCard(
              name: cartEntities[index].product.name,
              weight: '${cartEntities[index].product.unitAmount}كجم',
              price: cartEntities[index].product.price.toDouble(),
              imageUrl: cartEntities[index].product.imageUrl!,
              count: cartEntities[index].count,
              index: index,
            );
          },
        );
      },
    );
  }
}
