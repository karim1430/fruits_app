import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/widgets/custom_elevated_button.dart';
import '../../../../../core/utils/app_styles.dart';
import 'price_range_slider.dart';

class CustomShowModalBottomSheet extends StatefulWidget {
  const CustomShowModalBottomSheet({super.key, required this.isResultPage});
  final ValueChanged<bool> isResultPage;
  @override
  State<CustomShowModalBottomSheet> createState() =>
      _CustomShowModalBottomSheetState();
}

class _CustomShowModalBottomSheetState
    extends State<CustomShowModalBottomSheet> {
  int StartPrice = 0;
  int EndPrice = 1000;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.44,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Text(
                  'تصنيف حسب :',
                  style: AppStyles.textStyleBold16.copyWith(fontSize: 20),
                ),
                Row(
                  children: [
                    Image.asset('assets/price_icon.png'),
                    SizedBox(width: 5),
                    Text('السعر :', style: AppStyles.textStyleBold16),
                  ],
                ),
                SizedBox(height: 20),
                PriceRangeSlider(
                  onChanged: (RangeValues p1) {
                    setState(() {
                      // Update the price range values
                      StartPrice = p1.start.round();
                      EndPrice = p1.end.round();
                    });
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        buttonText: 'تصفية',
                        onPressed: () {
                          setState(() {
                            log(
                              'Start Price: $StartPrice, End Price: $EndPrice',
                            );
                            // Navigator.pop(context);
                            widget.isResultPage(true);
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
      child: SvgPicture.asset('assets/setting_icon.svg', width: 20, height: 20),
    );
  }
}
