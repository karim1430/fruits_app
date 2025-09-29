import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/custom_elevated_button.dart';

import '../../../../../core/widgets/custom_check_box.dart';

Future<dynamic> classifyLessOrMorePriceShowModal(
  BuildContext context,
  ValueChanged<bool> isResultPage,
) {
  int? selectedIndex;

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => Container(
          height: MediaQuery.of(context).size.height * 0.44,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Text(
                'تصنيف حسب :',
                style: AppStyles.textStyleBold16.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),

              CustomCheckBox(
                text: 'السعر ( الأقل الي الأعلي )',
                isSelected: selectedIndex == 0,
                onTap: () => setState(() => selectedIndex = 0),
              ),
              CustomCheckBox(
                text: 'السعر ( الأعلي الي الأقل )',
                isSelected: selectedIndex == 1,
                onTap: () => setState(() => selectedIndex = 1),
              ),
              CustomCheckBox(
                text: 'الأبجديه',
                isSelected: selectedIndex == 2,
                onTap: () => setState(() => selectedIndex = 2),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      buttonText: 'تصفية',
                      onPressed: () {
                        print("Selected Index: $selectedIndex");
                        setState(() {
                          // Navigator.pop(context);
                          isResultPage(true);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
