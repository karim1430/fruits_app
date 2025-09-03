import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';

import '../../../../../core/utils/app_styles.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.passwordRecoveryView);
          },
          child: Text(
            'هل نسيت كلمة المرور؟',
            style: AppStyles.textStyleSemi13.copyWith(color: Color(0xff2D9F5D)),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
