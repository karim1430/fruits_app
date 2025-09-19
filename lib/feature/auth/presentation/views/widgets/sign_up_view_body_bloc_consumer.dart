import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/routing/routes.dart';
import 'package:fruits_hub/core/utils/showSnackBar.dart';
import 'package:fruits_hub/feature/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../manager/sign_up_cubit/sign_up_cubit.dart';

class SignUpViewBodyBlocComsumer extends StatelessWidget {
  const SignUpViewBodyBlocComsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.homeView,
            (Route<dynamic> route) => false,
          );
          showSnackBar(context, 'تم إنشاء الحساب بنجاح');
        }
        if (state is SignUpFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
          child: SignUpViewBody(state: state),
        );
      },
    );
  }
}
