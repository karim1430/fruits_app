import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17, top: 16, bottom: 8),
      child: Row(
        children: [
          const Spacer(flex: 2),

          Text(
            'منتجاتنا',
            style: AppStyles.textStyleBold16.copyWith(fontSize: 20),
          ),
          SizedBox(width: 35),
          const Spacer(),
          CircleAvatar(
            child: IconButton(
              onPressed: () => {},
              icon: SvgPicture.asset('assets/notification_icon.svg'),
            ),
          ),
          // const SizedBox(width: 48), // للتوازن مع زر الرجوع
        ],
      ),
    );
  }
}
