import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/feature/products/presentation/views/widgets/classify_price.dart';

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
          ////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClassifyPrice(price: _currentRangeValues.start.round()),
              SizedBox(width: 14),
              Text('الي', style: AppStyles.textStyleBold16),
              SizedBox(width: 14),
              ClassifyPrice(price: _currentRangeValues.end.round()),
            ],
          ),
          ////////// Labels
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
