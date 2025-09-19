import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/constants.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/app_styles.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/widgets/custom_elevated_button.dart';

class CheckViewBody extends StatefulWidget {
  const CheckViewBody({super.key});

  @override
  State<CheckViewBody> createState() => _CheckViewBodyState();
}

class _CheckViewBodyState extends State<CheckViewBody> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'أدخل الرمز الذي أرسلناه إلى عنوان بريد التالي Maxxx@email.com',
                  style: AppStyles.textStyleSemi16.copyWith(
                    color: Color(0xff616A6B),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            SizedBox(height: 25),
            CustomPinCode(onChanged: (value) {}),
            SizedBox(height: 33),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    buttonText: 'تحقق من الرمز',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Navigator.of(context).pushNamed(Routes.newPasswordView);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text(
                'إعادة إرسال الرمز',
                style: AppStyles.textStyleSemi16.copyWith(color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPinCode extends StatelessWidget {
  const CustomPinCode({super.key, this.onChanged});
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
        validator: (value) {
          if (value == null) {
            return 'هذا الرقم مطلوب';
          }
          return null;
        },
        appContext: context,
        length: 4, // عدد المربعات
        animationType: AnimationType.scale,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 60,
          fieldWidth: 50,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveColor: Colors.grey.shade300,
          activeColor: Colors.orange,
          selectedColor: Colors.orange,
        ),
        enableActiveFill: true,
      ),
    );
  }
}
