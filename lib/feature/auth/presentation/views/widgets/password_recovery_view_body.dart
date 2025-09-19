import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/custom_elevated_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class PasswordRecoveryViewBody extends StatefulWidget {
  const PasswordRecoveryViewBody({super.key});

  @override
  State<PasswordRecoveryViewBody> createState() =>
      _PasswordRecoveryViewBodyState();
}

class _PasswordRecoveryViewBodyState extends State<PasswordRecoveryViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SizedBox(height: 33),
            Text(
              'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
              style: AppStyles.textStyleSemi16.copyWith(
                color: Color(0xff616A6B),
              ),
            ),
            SizedBox(height: 33),
            CustomTextFormField(
              labelText: 'رقم التليفون',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 33),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    buttonText: 'نسيت كلمة المرور',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Navigator.of(context).pushNamed(Routes.checkView);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
