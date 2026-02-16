import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_eyezon_app/core/theme/app_colors.dart';
import 'package:my_eyezon_app/core/theme/app_text_styles.dart';

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
    return SizedBox(
      height: 70,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.background2,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildItem(
                    index: 0,
                    height: 22,
                    iconPath: "assets/icons/Home.svg",
                    label: "الصفحة الرئيسية",
                  ),
                  _buildItem(
                    index: 1,
                    height: 16,
                    iconPath: "assets/icons/Criminal_status.svg",
                    label: "حالة الاشخاص",
                  ),

                  const SizedBox(width: 60),

                  _buildItem(
                    index: 3,
                    height: 16,
                    iconPath: "assets/icons/User.svg",
                    label: "الأشخاص المطلوبة",
                  ),
                  _buildItem(
                    index: 4,
                    height: 22,
                    iconPath: "assets/icons/Settings.svg",
                    label: "الإعدادات",
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: -50,
            child: GestureDetector(
              onTap: () => onTap(2),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.background,
                      blurRadius: 0,
                      spreadRadius: 10,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required int index,
    required String iconPath,
    required String label,
    required double height,
  }) {
    final bool isSelected = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: height,
              color: isSelected
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: isSelected
                  ? AppTextStyles.bold11
                  : AppTextStyles.bold11.copyWith(
                      color: AppColors.textSecondary,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
