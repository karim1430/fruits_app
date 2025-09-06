import 'package:flutter/material.dart';
import 'package:fruits_hub/feature/auth/presentation/views/widgets/divider_widget.dart';
import 'package:fruits_hub/feature/auth/presentation/views/widgets/google_facebook_apple.dart';

import '../../../../../core/utils/assets.dart';

class OtherLogin extends StatelessWidget {
  const OtherLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DividerWidget(),
        SizedBox(height: 33),

        GoogleFaceBookApple(title: 'تسجيل بواسطة جوجل', logo: Assets.google),
        SizedBox(height: 16),
        GoogleFaceBookApple(title: 'تسجيل بواسطة ابل', logo: Assets.apple),

        SizedBox(height: 16),
        GoogleFaceBookApple(
          title: 'تسجيل بواسطة فيس بوك',
          logo: Assets.facebook,
        ),
      ],
    );
  }
}
