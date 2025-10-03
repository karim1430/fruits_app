import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/app_bar_title_and_arrow_widget.dart';
import '../../manager/cubit/shopping_cart_cubit.dart';
import 'food_item_card_list_view.dart';

class ShoppingViewBody extends StatelessWidget {
  const ShoppingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              AppBarTitleAndArrowWidget(title: 'سلة التسوق'),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0xffEBF9F1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: Text(
                      'لديك ${context.watch<ShoppingCartCubit>().cartItems.length} منتجات في سله التسوق',
                      style: AppStyles.textStyleSemi13.copyWith(
                        color: Color(0xff1B5E37),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(child: FoodItemCardListView()),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 17,
            right: 17,
            child: CustomElevatedButton(
              buttonText: 'الدفع 120 جنيه',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
