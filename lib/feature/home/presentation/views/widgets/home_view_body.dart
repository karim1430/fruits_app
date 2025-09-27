import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/get_user.dart';
import 'package:fruits_hub/feature/home/presentation/views/widgets/fruit_promo_card.dart';
import 'package:fruits_hub/feature/home/presentation/views/widgets/search_custom.dart';
import '../../../../Best Selling/presentation/views/best_selling_view.dart';
import 'the_best_selling_fruit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchBestSellingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'صباح الخير !..',
                style: AppStyles.textStyleSemi16.copyWith(
                  color: Color(0xff949D9E),
                ),
              ),
              subtitle: Text(getUser().name, style: AppStyles.textStyleBold16),
              leading: CircleAvatar(
                child: SvgPicture.asset('assets/Ellipse_icon.svg'),
              ),
              trailing: CircleAvatar(
                child: SvgPicture.asset('assets/notification_icon.svg'),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SearchCustom()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FruitPromoCard();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                children: [
                  Text(
                    'الأكثر مبيعًا',
                    style: AppStyles.textStyleBold16.copyWith(fontSize: 20),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BestSellingView(),
                        ),
                      );
                    },
                    child: Text('المزيد', style: AppStyles.textStyleBold13),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            sliver: SliverGrid.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return TheBestSellingFruit();
              },
            ),
          ),
        ],
      ),
    );
  }
}




// Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 158,

//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       bottomLeft: Radius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   height: 158,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.only(
//                       // bottomLeft: Radius.circular(50),
//                       // bottomRight: Radius.circular(50),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),