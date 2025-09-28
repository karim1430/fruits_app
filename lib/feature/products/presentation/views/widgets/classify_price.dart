import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class ClassifyPrice extends StatelessWidget {
  const ClassifyPrice({super.key, required this.price});
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xffEFF3F4),
        border: BoxBorder.all(color: Color(0xffCDD2DE)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Text('$price', style: AppStyles.textStyleBold13)),
    );
  }
}
