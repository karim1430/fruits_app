import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/constants.dart';
import 'package:fruits_hub/core/widgets/custom_elevated_button.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/increment_and_decrement_item.dart';
import 'custom_stack_widget.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomStackWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // النصوص (العنوان + السعر)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('تفاح', style: AppStyles.textStyle19),
                            SizedBox(height: 4),
                            Text(
                              '22 جنيه / كجم',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // الأزرار (زيادة/نقصان)
                      IncrementAndDecrementItem(index: 0),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 10),
                      Text('4.5', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.reviewsView);
                        },
                        child: Text(
                          'المراجعات',
                          style: AppStyles.textStyleBold16.copyWith(
                            color: kPrimaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'التفاح هو فاكهة تنمو على أشجار التفاح (Malus domestica). وهو من أكثر الفواكه استهلاكًا في العالم، ويأتي في مجموعة متنوعة من الألوان والأحجام والنكهات. التفاح غني بالألياف والفيتامينات، ويعتبر خيارًا صحيًا للوجبات الخفيفة والطهي.',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      AdditionInfoItemDetails(
                        title: 'عام',
                        subtitle: 'الصلاحية',
                        iconPath: 'assets/general_icon.svg',
                      ),
                      SizedBox(width: 20),
                      AdditionInfoItemDetails(
                        title: '100%',
                        subtitle: 'اورجانيك',
                        iconPath: 'assets/organic_icon.svg',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      AdditionInfoItemDetails(
                        title: '80 كالوري',
                        subtitle: '100 جرام',
                        iconPath: 'assets/calory_icon.svg',
                      ),
                      SizedBox(width: 20),
                      AdditionInfoItemDetails(
                        title: '4.8 (256)',
                        subtitle: 'Reviews',
                        iconPath: 'assets/favourites_icon.svg',
                      ),
                    ],
                  ),
                  SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      buttonText: 'إضافة إلى السلة',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdditionInfoItemDetails extends StatelessWidget {
  const AdditionInfoItemDetails({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
  });
  final String title;
  final String subtitle;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),

      child: ListTile(
        title: Text(
          title,
          style: AppStyles.textStyleBold16.copyWith(
            fontSize: 18,
            color: kLightPrimaryColor,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            subtitle,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ),
        trailing: SvgPicture.asset(
          iconPath,
          width: 30,
          height: 30,
          placeholderBuilder: (context) =>
              Icon(Icons.info, color: kPrimaryColor, size: 30),
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.info, color: kPrimaryColor, size: 30),
        ),
      ),
    );
  }
}
