import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruits_hub/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub/core/services/service_allocator.dart';
import 'package:fruits_hub/core/utils/constants.dart';
import 'package:fruits_hub/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:fruits_hub/feature/my_account/presentation/views/my_account_view.dart';
import 'package:fruits_hub/feature/shopping/presentation/views/shopping_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../products/presentation/views/product_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => ProductCubit(getIt.get<ProductRepo>()),
      child: HomeViewBody(),
    ),
    ProductView(),
    ShoppingView(),
    MyAccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black12.withOpacity(0.1)),
            ],
          ),
          child: buttomNavigationBar(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

Padding buttomNavigationBar({
  required int selectedIndex,
  required Function(int) onTabChange,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
    child: GNav(
      rippleColor: Colors.grey[300]!,
      hoverColor: Colors.grey[100]!,
      haptic: true,
      tabBorderRadius: 20,
      gap: 8,
      activeColor: Colors.white,
      color: Colors.black54,
      iconSize: 24,
      padding: const EdgeInsets.symmetric(),
      duration: const Duration(milliseconds: 200),
      tabBackgroundColor: Colors.grey.shade300,
      backgroundColor: Colors.white,
      tabs: [
        GButton(
          textStyle: const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
          icon: Icons.circle,
          iconColor: Colors.transparent,
          leading: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex == 0 ? kPrimaryColor : Colors.white,
            ),
            child: SvgPicture.asset(
              "assets/home_icon.svg",
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                selectedIndex == 0 ? Colors.white : Colors.grey.shade400,
                BlendMode.srcIn,
              ),
            ),
          ),
          text: 'الرئيسية',
        ),
        GButton(
          textStyle: const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
          icon: Icons.circle,
          iconColor: Colors.transparent,
          leading: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex == 1 ? kPrimaryColor : Colors.white,
            ),
            child: SvgPicture.asset(
              "assets/product_icon.svg",
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                selectedIndex == 1 ? Colors.white : Colors.grey.shade400,
                BlendMode.srcIn,
              ),
            ),
          ),
          text: 'المنتجات',
        ),
        GButton(
          textStyle: const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
          icon: Icons.circle,
          iconColor: Colors.transparent,
          leading: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex == 2 ? kPrimaryColor : Colors.white,
            ),
            child: SvgPicture.asset(
              "assets/shopping_cart_icon.svg",
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                selectedIndex == 2 ? Colors.white : Colors.grey.shade400,
                BlendMode.srcIn,
              ),
            ),
          ),
          text: 'سلة التسوق',
        ),
        GButton(
          textStyle: const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
          icon: Icons.circle,
          iconColor: Colors.transparent,
          leading: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex == 3 ? kPrimaryColor : Colors.white,
            ),
            child: SvgPicture.asset(
              "assets/user_icon.svg",
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                selectedIndex == 3 ? Colors.white : Colors.grey.shade400,
                BlendMode.srcIn,
              ),
            ),
          ),
          text: 'حسابي',
        ),
      ],
      selectedIndex: selectedIndex,
      onTabChange: onTabChange,
    ),
  );
}
