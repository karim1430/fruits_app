import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/feature/auth/presentation/views/widgets/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/showSnackBar.dart';
import '../../manager/sign_in_cubit/sign_in_cubit.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.homeView,
            (Route<dynamic> route) => false,
          );
          showSnackBar(context, 'تم تسجيل الدخول بنجاح');
        }
        if (state is SignInFailure) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
