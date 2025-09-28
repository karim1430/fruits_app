import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

import '../../../../../core/utils/constants.dart';

class CustomCheckBox extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCheckBox({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Checkbox(
            side: BorderSide(color: const Color(0xff949D9E)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            checkColor: Colors.white,
            activeColor: kPrimaryColor,
            value: isSelected,
            onChanged: (_) => onTap(),
          ),
          Text(
            text,
            style: AppStyles.textStyleBold13.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
