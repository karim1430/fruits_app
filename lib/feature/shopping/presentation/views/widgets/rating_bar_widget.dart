import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/feature/shopping/presentation/views/widgets/review_and_rating_view_body.dart';

import 'rating_distribution.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Text('4.5', style: AppStyles.textStyleBold16),
                ],
              ),
              Text('88% موصي بيها', style: AppStyles.textStyleSemi16),
            ],
          ),
          SizedBox(width: 20),
          Expanded(child: RatingDistribution()),
        ],
      ),
    );
  }
}
