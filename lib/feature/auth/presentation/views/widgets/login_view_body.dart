import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_elevated_button.dart';
import 'package:fruits_hub/feature/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'custom_create_account.dart';
import 'forget_password.dart';
import 'other_login.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isObscure = true;
  bool visible = false;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                labelText: 'تسجيل الدخول',
                onSaved: (value) {
                  email = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا البريد الإلكتروني مطلوب';
                  }
                  final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'البريد الإلكتروني غير صالح';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                labelText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
                obscureText: isObscure,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: isObscure
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 20),
              ForgetPassword(),
              SizedBox(
                height: 54,
                width: double.infinity,
                child: CustomElevatedButton(
                  buttonText: 'تسجيل دخول',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SignInCubit>()
                          .signInUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ),
              SizedBox(height: 33),
              CustomCreateAcount(),
              SizedBox(height: 33),
              OtherLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
