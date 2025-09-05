import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';

import '../../../../../core/utils/app_styles.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تمتلك حساب بالفعل؟',
          style: AppStyles.textStyleSemi16.copyWith(color: Color(0xff616A6B)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Routes.loginView);
          },
          child: Text(
            ' تسجيل دخول',
            style: AppStyles.textStyleSemi16.copyWith(color: Color(0xff1B5E37)),
          ),
        ),
      ],
    );
  }
}
