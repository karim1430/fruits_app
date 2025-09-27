import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'widgets/the_best_selling_fruit.dart';
import 'widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: CircleAvatar(
      //     child: SvgPicture.asset('assets/notification_icon.svg'),
      //   ),
      //   title: Text('الأكثر مبيعًا', style: AppStyles.textStyle19),
      //   centerTitle: true,
      //   actions: [
      //     CircleAvatar(
      //       child: IconButton(
      //         onPressed: () => Navigator.of(context).pop(),
      //         icon: const Icon(Icons.arrow_back_ios),
      //       ),
      //     ),
      //   ],
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: BestSellingViewBody(),
    );
  }
}
