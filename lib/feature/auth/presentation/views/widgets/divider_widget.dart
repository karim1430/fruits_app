import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart' show AppStyles;

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(thickness: 1, color: Colors.grey, endIndent: 10),
        ),
        Text("أو  ", style: AppStyles.textStyleBold16),
        Expanded(
          child: Divider(thickness: 1, color: Colors.grey, endIndent: 10),
        ),
      ],
    );
  }
}
