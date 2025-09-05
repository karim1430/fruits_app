import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';

import 'package:fruits_hub/core/widgets/custom_elevated_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/feature/sign%20up/presentation/views/widgets/have_an_acount.dart';

import 'condition_and_control.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool check = false;
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
              CustomTextFormField(labelText: 'الاسم كامل'),
              SizedBox(height: 16),
              CustomTextFormField(labelText: 'البريد الإلكتروني'),
              SizedBox(height: 16),
              CustomTextFormField(labelText: 'كلمة المرور'),
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
                  onPressed: () {
                    if (formKey.currentState!.validate() && check == true) {
                      formKey.currentState!.save();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.homeView,
                        (Route<dynamic> route) => false,
                      );
                      setState(() {});
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
