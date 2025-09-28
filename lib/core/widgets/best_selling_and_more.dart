import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class BestSellingAndMore extends StatelessWidget {
  const BestSellingAndMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          style: AppStyles.textStyleBold16.copyWith(fontSize: 20),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.bestSellingView);
          },
          child: Text('المزيد', style: AppStyles.textStyleBold13),
        ),
      ],
    );
  }
}
