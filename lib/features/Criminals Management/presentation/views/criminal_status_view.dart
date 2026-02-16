import 'package:flutter/material.dart';
import 'package:my_eyezon_app/core/theme/app_colors.dart';
import 'package:my_eyezon_app/core/theme/app_text_styles.dart';
import 'package:my_eyezon_app/features/Criminals%20Management/presentation/views/widgets/criminal_card.dart';

class CriminalStatusView extends StatefulWidget {
  const CriminalStatusView({Key? key}) : super(key: key);

  @override
  State<CriminalStatusView> createState() => _ApplicantsStatusScreenState();
}

class _ApplicantsStatusScreenState extends State<CriminalStatusView> {
  bool isArrested = false;

  final List<Map<String, String>> ArrestedList = [
    {
      'name': 'محمد حسام',
      'program': '7000',
      'date': 'تاريخ الدورة : 3/3/2023',
      'image': 'assets/images/Admin_profile_image.png',
    },
    {
      'name': 'محمد حسام',
      'program': '7000',
      'date': 'تاريخ الدورة : 3/3/2023',
      'image': 'assets/images/Admin_profile_image.png',
    },
    {
      'name': 'محمد حسام',
      'program': '7000',
      'date': 'تاريخ الدورة : 3/3/2023',
      'image': 'assets/images/Admin_profile_image.png',
    },
  ];

  final List<Map<String, String>> notArrestedList = [
    {
      'name': 'محمد حسام',
      'program': '7000',
      'date': 'تاريخ الدورة : 3/3/2023',
      'image': 'assets/images/Admin_profile_image.png',
    },
    {
      'name': 'محمد حسام',
      'program': '7000',
      'date': 'تاريخ الدورة : 3/3/2023',
      'image': 'assets/images/Admin_profile_image.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('الأشخاص المطلوبين', style: AppTextStyles.bold18),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildToggleButton(),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildApplicantsList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.background2,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isArrested = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: !isArrested ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Text(
                      'تم القبض',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: !isArrested
                            ? AppColors.textPrimary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isArrested = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: isArrested ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Text(
                      'لم يتم القبض',
                      style: AppTextStyles.medium14.copyWith(
                        color: isArrested
                            ? AppColors.textPrimary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicantsList() {
    final applicants = isArrested ? ArrestedList : notArrestedList;

    return ListView.builder(
      key: ValueKey(isArrested),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemCount: applicants.length,
      itemBuilder: (context, index) {
        return CriminalCard(
          name: applicants[index]['name']!,
          serialNumber: applicants[index]['program']!,
          crimeDate: applicants[index]['date']!,
          imagePath: applicants[index]['image']!,
        );
      },
    );
  }
}
