import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';
import 'package:fruits_hub/feature/onboarding/presentation/views/widgets/custom_buble.dart';
// Removed Google Fonts to avoid network fetch; using bundled font from pubspec

import 'on_boarding_page.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController pageController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                reverse: true,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 1);
                },
                children: [
                  OnboardPage(
                    title: 'مرحبًا بك في FruitHUB',
                    description:
                        'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
                    imageAsset: 'assets/Vector.svg',
                    imageColor: Colors.orange.shade100,
                    centerImageAsset: 'assets/fruit basket.svg',
                    isLastPage: isLastPage,
                  ),
                  OnboardPage(
                    title: 'ابحث وتسوق',
                    description:
                        'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
                    imageAsset: 'assets/Vector.svg',
                    imageColor: Colors.green.shade200,
                    centerImageAsset: 'assets/pineapple.svg',
                    isLastPage: isLastPage,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            CustomBuble(isLastPage: isLastPage),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 8, 137, 13),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (isLastPage) {
                    Navigator.pushNamed(context, Routes.loginView);
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Text(
                  isLastPage ? 'ابدأ الآن' : 'التالي',
                  style: const TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
