import 'package:flutter/material.dart';
import 'on_page_product.dart';
import 'on_page_result.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  final PageController pageController = PageController();
  bool isResultPage = false;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isResultPage,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && isResultPage) {
          setState(() {
            isResultPage = false;
            pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        }
      },
      child: SafeArea(
        child: PageView(
          reverse: true,
          controller: pageController,
          physics: isResultPage ? NeverScrollableScrollPhysics() : null,
          children: [
            OnPageProduct(
              isResultPage: (bool value) {
                setState(() {
                  isResultPage = value;
                  if (value) {
                    pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                });
              },
            ),
            OnPageResult(
              isResultPage: (bool value) {
                setState(() {
                  isResultPage = value;
                  if (!value) {
                    pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fruits_hub/core/widgets/app_bar_widget.dart';
// import 'package:fruits_hub/core/widgets/best_selling_and_more.dart';
// import 'package:fruits_hub/core/widgets/custom_circle_avatar.dart';
// import 'package:fruits_hub/feature/Best%20Selling/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
// import '../../../../../core/utils/app_styles.dart';
// import '../../../../home/presentation/views/widgets/search_custom.dart';
// import 'clissify_less_or_more_price_show_modal.dart';

// class ProductViewBody extends StatelessWidget {
//   const ProductViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(child: AppBarWidget()),
//           SliverToBoxAdapter(child: SearchCustom()),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(right: 17),
//               child: Row(
//                 children: [
//                   Text(
//                     'منتجاتنا',
//                     style: AppStyles.textStyleBold16.copyWith(fontSize: 20),
//                   ),
//                   Spacer(),
//                   TextButton(
//                     onPressed: () async {
//                       await classifyLessOrMorePriceShowModal(context);
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 8,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Color(0xffEFF3F4),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: SvgPicture.asset(
//                         'assets/arrow-swap-horizontal.svg',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           SliverToBoxAdapter(child: CustomCircleAvatr()),

//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(right: 17, top: 17),
//               child: BestSellingAndMore(),
//             ),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.symmetric(horizontal: 17),
//             sliver: BestSellingGridViewBlocBuilder(),
//           ),
//         ],
//       ),
//     );
//   }
// }