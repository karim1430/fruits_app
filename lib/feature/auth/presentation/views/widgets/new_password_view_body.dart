import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class NewPasswordViewBody extends StatefulWidget {
  const NewPasswordViewBody({super.key});

  @override
  State<NewPasswordViewBody> createState() => _NewPasswordViewBodyState();
}

class _NewPasswordViewBodyState extends State<NewPasswordViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;
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
              'قم بإنشاء كلمة مرور جديدة لتسجيل الدخول',
              style: AppStyles.textStyleSemi16,
            ),
            SizedBox(height: 33),
            CustomTextFormField(
              labelText: 'كلمة المرور الجديده',
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
            SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'تأكيد كلمة المرور الجديده',
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
            SizedBox(height: 33),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    buttonText: 'إنشاء كلمة مرور جديدة',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        awesomeDialogCustom(
                          context,
                          'Successfuly',
                          DialogType.noHeader,
                          btnOkOnPress: () {},
                          widget: Center(
                            child: SvgPicture.asset(Assets.rightPassword),
                          ),
                        ).show();

                        // Navigator.of(context).pushNamed(Routes.homeView);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
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

AwesomeDialog awesomeDialogCustom(
  BuildContext context,
  String typeTitle,

  DialogType dialogType, {
  void Function()? btnOkOnPress,
  Widget? widget,
  String? description,
}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: typeTitle,
    desc: description,
    btnCancelOnPress: () {},
    btnOkOnPress: btnOkOnPress,
    body: widget,
  );
}
