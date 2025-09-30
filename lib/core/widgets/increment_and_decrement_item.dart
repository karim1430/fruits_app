import 'package:flutter/material.dart';

class IncrementAndDecrementItem extends StatefulWidget {
  const IncrementAndDecrementItem({super.key});

  @override
  State<IncrementAndDecrementItem> createState() =>
      _IncrementAndDecrementItemState();
}

class _IncrementAndDecrementItemState extends State<IncrementAndDecrementItem> {
  int quantity = 1;

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
          '$quantity',
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
