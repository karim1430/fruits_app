import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول', style: AppStyles.textStyle19),
        centerTitle: true,
      ),
      body: LoginViewBody(),
    );
  }
}
