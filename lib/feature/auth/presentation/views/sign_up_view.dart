import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/app_par_build.dart';

import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(title: 'حساب جديد'),
      body: SignUpViewBody(),
    );
  }
}
