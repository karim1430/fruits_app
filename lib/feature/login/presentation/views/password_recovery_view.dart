import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

import 'widgets/password_recovery_view_body.dart';

class PasswordRecoveryView extends StatelessWidget {
  const PasswordRecoveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نسيان كلمة المرور', style: AppStyles.textStyle19),
        centerTitle: true,
      ),
      body: PasswordRecoveryViewBody(),
    );
  }
}
