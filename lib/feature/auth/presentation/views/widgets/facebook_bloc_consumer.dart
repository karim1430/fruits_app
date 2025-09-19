import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/feature/auth/presentation/manager/sign_in_with_facebook/sign_in_with_facebook_cubit.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/showSnackBar.dart';
import 'google_facebook_apple.dart';

class FacebookBlocConsumer extends StatelessWidget {
  const FacebookBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInWithFacebookCubit, SignInWithFacebookState>(
      listener: (context, state) {
        if (state is SignInWithFacebookSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.homeView,
            (Route<dynamic> route) => false,
          );
          showSnackBar(context, 'تم تسجيل الدخول بنجاح');
        }
        if (state is SignInWithFacebookFailure) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return GoogleFaceBookApple(
          onTap: () async {
            await context
                .read<SignInWithFacebookCubit>()
                .signInORcreateUserWithFacebook();
          },
          title: 'تسجيل بواسطة فيس بوك',
          logo: Assets.facebook,
        );
      },
    );
  }
}
