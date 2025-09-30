import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';

import '../../../../../core/widgets/increment_and_decrement_item.dart';

class FoodItemCard extends StatefulWidget {
  final String name;
  final String weight;
  final double price;
  final String imageUrl;

  const FoodItemCard({
    super.key,
    required this.name,
    required this.weight,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<FoodItemCard> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).popAndPushNamed(Routes.detailsItemView);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
            horizontal: BorderSide(color: Color(0xffF1F1F5), width: 2),
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 92,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.fastfood,
                      size: 40,
                      color: Colors.grey.shade400,
                    );
                  },
                ),
              ),
            ),

            // Delete Icon
            const SizedBox(width: 12),

            // Item Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.delete_outline,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      widget.weight,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IncrementAndDecrementItem(),

                      const Spacer(),
                      Text(
                        '${widget.price.toStringAsFixed(0)} جنية',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Item Image
          ],
        ),
      ),
    );
  }
}
