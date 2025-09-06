import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

import '../../../../core/widgets/app_par_build.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(title: 'تسجيل الدخول'),
      body: LoginViewBody(),
    );
  }
}
