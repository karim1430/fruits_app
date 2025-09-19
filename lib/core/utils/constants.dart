import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

const kPrimaryColor = Color(0xff1B5E37);
const kLightPrimaryColor = Color(0xff2D9F5D);

tabGButton({required int selectedIndex}) {
  return [
    GButton(
      textStyle: const TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.w600,
      ),
      icon: Icons.circle, // Placeholder
      iconColor: Colors.transparent, // إخفاء الأيقونة الافتراضية
      leading: Container(
        padding: const EdgeInsets.all(6), // مسافة صغيرة حوالين الـ svg
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedIndex == 0 ? kPrimaryColor : Colors.white,
        ),
        child: SvgPicture.asset(
          "assets/home_icon.svg",
          width: 20, // أصغر شوية عشان يدخل جوه الدائرة
          height: 20,
          colorFilter: ColorFilter.mode(
            selectedIndex == 0
                ? Colors.white
                : Colors.grey.shade400, // خلي الأيقونة بيضاء جوه الدائرة
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
      icon: Icons.circle, // أيقونة Placeholder
      iconColor: Colors.transparent, // نخليها شفافة عشان متبانش
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
      icon: Icons.circle, // أيقونة Placeholder
      iconColor: Colors.transparent, // نخليها شفافة عشان متبانش
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
      icon: Icons.circle, // أيقونة Placeholder
      iconColor: Colors.transparent, // نخليها شفافة عشان متبانش
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
  ];
}
