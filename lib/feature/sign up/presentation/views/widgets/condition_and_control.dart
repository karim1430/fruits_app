import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

import '../../../../../core/utils/constants.dart';

class ConditionAndControls extends StatefulWidget {
  const ConditionAndControls({super.key, this.onCheckChanged});
  final ValueChanged<bool>? onCheckChanged;
  @override
  State<ConditionAndControls> createState() => _ConditionAndControlsState();
}

class _ConditionAndControlsState extends State<ConditionAndControls> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: kPrimaryColor,
          value: check,
          onChanged: (value) {
            if (value == true) {
              check = true;
              widget.onCheckChanged?.call(check);
              setState(() {});
            } else {
              check = false;
              widget.onCheckChanged?.call(check);
              setState(() {});
            }
          },
        ),

        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppStyles.textStyleSemi13, // ستايل أساسي للنص
              children: [
                const TextSpan(text: 'من خلال إنشاء حساب ، فإنك توافق على '),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: AppStyles.textStyleSemi13.copyWith(
                    color: kLightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
