import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_elevated_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/feature/auth/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:fruits_hub/feature/auth/presentation/views/widgets/have_an_acount.dart';
import 'condition_and_control.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key, required this.state});
  final SignUpState state;

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool check = false;
  String? email, password, name;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                labelText: 'الاسم كامل',
                onSaved: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                labelText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
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
                onSaved: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                labelText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onSaved: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 16),
              ConditionAndControls(
                onCheckChanged: (value) {
                  check = value;
                },
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  buttonText: 'إنشاء حساب جديد',
                  onPressed: () async {
                    if (formKey.currentState!.validate() && check == true) {
                      formKey.currentState!.save();
                      await context
                          .read<SignUpCubit>()
                          .createUserWithEmailAndPassword(
                            email: email!,
                            password: password!,
                            name: name!,
                          );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ),
              SizedBox(height: 26),
              HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
