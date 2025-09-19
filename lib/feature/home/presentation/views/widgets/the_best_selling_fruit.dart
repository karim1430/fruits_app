import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_hub/core/utils/constants.dart';

import '../../../../../core/utils/app_styles.dart';

class TheBestSellingFruit extends StatelessWidget {
  const TheBestSellingFruit({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffF3F5F7),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.heart),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: SvgPicture.asset(
                  'assets/fruit_hup_icon.svg',
                  height: 80,
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'الفراوله',
                        style: AppStyles.textStyleSemi13.copyWith(
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '30جنية / الكيلو',
                        style: AppStyles.textStyleBold13.copyWith(
                          color: Colors.amberAccent,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: kPrimaryColor,
                  ),
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 16,
                    color: Colors.white,
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
