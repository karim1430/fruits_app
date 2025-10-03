import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/feature/shopping/presentation/manager/cubit/shopping_cart_cubit.dart';

class IncrementAndDecrementItem extends StatefulWidget {
  const IncrementAndDecrementItem({super.key, required this.index});
  final int index;
  @override
  State<IncrementAndDecrementItem> createState() =>
      _IncrementAndDecrementItemState();
}

class _IncrementAndDecrementItemState extends State<IncrementAndDecrementItem> {
  int quantity = 1;
  @override
  void initState() {
    quantity = context.read<ShoppingCartCubit>().cartItems[widget.index].count;
    super.initState();
  }

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildQuantityButton(
          icon: Icons.remove,
          onTap: _decrementQuantity,
          color: Colors.grey.shade300,
        ),
        const SizedBox(width: 12),
        Text(
          '${quantity}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 12),
        buildQuantityButton(
          icon: Icons.add,
          onTap: _incrementQuantity,
          color: Colors.green.shade600,
        ),
      ],
    );
  }

  Widget buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}
