import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomCreateAcount extends StatelessWidget {
  const CustomCreateAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتك حساب ؟',
          style: AppStyles.textStyleSemi16.copyWith(color: Color(0xff616A6B)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.signUpview);
          },
          child: Text(
            'قم بإنشاء حساب',
            style: AppStyles.textStyleSemi16.copyWith(color: Color(0xff1B5E37)),
          ),
        ),
      ],
    );
  }
}
