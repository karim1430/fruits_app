import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_hub/core/utils/constants.dart';
import 'package:fruits_hub/core/widgets/safe_svg_widget.dart';
import '../../../../../core/entities/product_entity.dart';
import '../../../../../core/utils/app_styles.dart';

class TheBestSellingFruit extends StatelessWidget {
  const TheBestSellingFruit({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    log(productEntity.imageUrl.toString());
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
                child: Image.network(
                  productEntity.imageUrl!,
                  height: 80,
                  width: 80,
                  errorBuilder: (context, error, stackTrace) {
                    log(
                      'Image loading error for ${productEntity.imageUrl}: $error',
                    );
                    return SizedBox(
                      height: 80,
                      child: Icon(Icons.broken_image),
                    );
                  },
                ),
              ),
              //  Center(
              //   child: productEntity.imageUrl == null
              //       ? SizedBox(height: 80, child: Icon(Icons.image))
              //       : SafeSvgWidget.network(
              //           productEntity.imageUrl!,
              //           width: 80,
              //           height: 80,
              //           // fallbackWidget: SizedBox(
              //           //   height: 80,
              //           //   child: Icon(Icons.broken_image),
              //           // ),
              //         ),
              // ),
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
