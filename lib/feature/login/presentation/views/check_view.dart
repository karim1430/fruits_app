import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import 'widgets/check_view_body.dart';

class CheckView extends StatelessWidget {
  const CheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التحقق من الرمز', style: AppStyles.textStyle19),
        centerTitle: true,
      ),
      body: CheckViewBody(),
    );
  }
}
