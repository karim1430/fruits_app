import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';
import 'package:fruits_hub/core/widgets/custom_elevated_button.dart';

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
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
              CustomTextFormField(labelText: 'تسجيل الدخول'),
              SizedBox(height: 16),
              CustomTextFormField(
                labelText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
                obscureText: isObscure,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye),
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
                      Navigator.of(context).pushNamed(Routes.homeView);
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
