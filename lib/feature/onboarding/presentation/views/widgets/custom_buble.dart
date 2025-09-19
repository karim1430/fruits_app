import 'package:flutter/material.dart';

class CustomBuble extends StatelessWidget {
  const CustomBuble({super.key, required this.isLastPage});

  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIndicator(isActive: isLastPage),
        const SizedBox(width: 8),
        _buildIndicator(isActive: true),
      ],
    );
  }

  Widget _buildIndicator({required bool isActive}) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.green.shade100,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
