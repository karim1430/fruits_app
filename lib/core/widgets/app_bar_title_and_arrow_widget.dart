import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class AppBarTitleAndArrowWidget extends StatelessWidget {
  const AppBarTitleAndArrowWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, top: 16),
      child: Row(
        children: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_back)),

          SizedBox(width: 35),
          const Spacer(flex: 1),
          Text(title, style: AppStyles.textStyleBold16.copyWith(fontSize: 20)),
          const Spacer(flex: 2),
          // const SizedBox(width: 48), // للتوازن مع زر الرجوع
        ],
      ),
    );
  }
}
