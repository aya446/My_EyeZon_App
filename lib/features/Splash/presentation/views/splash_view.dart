import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_eyezon_app/core/routes/app_routes.dart';
import 'package:my_eyezon_app/core/theme/app_colors.dart';
import 'package:my_eyezon_app/core/theme/app_text_styles.dart';
import 'package:my_eyezon_app/core/widgets/custom_button.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 220),
              Image.asset(
                'assets/images/App_logo.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 32),
              Text(
                'مرحبا بك، اختر طريقة الدخول',
                style: AppTextStyles.bold20,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'يرجى اختيار وضع التشغيل المناسب بإشراف الجهات المختصة',
                style: AppTextStyles.semiBold14.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButton(
                color: AppColors.background2,
                text: 'تشغيل البث المباشر',
                onTap: () {
                  context.go(AppRoutes.stream);
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                color: AppColors.primary,
                text: 'تسجيل الدخول كمشرف',
                onTap: () {
                  context.go(AppRoutes.login);
                },
              ),
              const SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}
