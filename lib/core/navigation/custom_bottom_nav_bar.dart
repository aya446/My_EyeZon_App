import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_eyezon_app/core/theme/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textPrimary,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Home.svg',
              color: currentIndex == 0
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
            label: 'الصفحة الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Criminal_status.svg',
              color: currentIndex == 1
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
            label: 'حالة الاشخاص',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/User.svg',
              color: currentIndex == 2
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
            label: 'الأشخاص المطلوبة',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Settings.svg",
              color: currentIndex == 2
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
            label: 'الإعدادات',
          ),
        ],
      ),
    );
  }
}
