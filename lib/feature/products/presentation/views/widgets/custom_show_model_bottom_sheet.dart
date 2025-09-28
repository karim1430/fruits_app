import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/widgets/custom_elevated_button.dart';
import 'package:fruits_hub/feature/products/presentation/views/widgets/classify_price.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomShowModalBottomSheet extends StatefulWidget {
  const CustomShowModalBottomSheet({super.key});

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
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClassifyPrice(price: StartPrice),
                    SizedBox(width: 14),
                    Text('الي', style: AppStyles.textStyleBold16),
                    SizedBox(width: 14),
                    ClassifyPrice(price: EndPrice),
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
                        onPressed: () {},
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

class PriceRangeSlider extends StatefulWidget {
  final Function(RangeValues) onChanged; // callback

  const PriceRangeSlider({super.key, required this.onChanged});

  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(0, 300);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${_currentRangeValues.start.round()}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${_currentRangeValues.end.round()}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // RangeSlider
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 1000,
            divisions: 100,
            activeColor: Colors.green[900],
            inactiveColor: Colors.grey[300],
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
              widget.onChanged(values); // نرجع القيم لبره
            },
          ),
        ],
      ),
    );
  }
}
