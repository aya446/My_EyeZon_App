import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_eyezon_app/core/routes/app_routes.dart';
import 'package:my_eyezon_app/core/theme/app_colors.dart';
import 'package:my_eyezon_app/core/theme/app_text_styles.dart';
import 'package:my_eyezon_app/core/widgets/custom_button.dart';
import 'package:my_eyezon_app/core/widgets/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 130),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: AppTextStyles.bold24,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'أهلا وسهلا..',
                    style: AppTextStyles.medium15.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 120),
              CustomTextfield(
                hintText: 'أدخل الايميل',
                controller: nameController,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomTextfield(
                hintText: 'ادخل كلمة المرور',
                isPassword: true,
                controller: passwordController,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'نسيت كلمة السر؟',
                  style: AppTextStyles.medium12.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                color: AppColors.primary,
                text: 'تسجيل الدخول',
                onTap: () {
                  context.go(AppRoutes.home);
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
