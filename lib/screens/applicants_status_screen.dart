import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class ApplicantsStatusScreen extends StatefulWidget {
  const ApplicantsStatusScreen({Key? key}) : super(key: key);

  @override
  State<ApplicantsStatusScreen> createState() => _ApplicantsStatusScreenState();
}

class _ApplicantsStatusScreenState extends State<ApplicantsStatusScreen> {
  bool isAccepted = true;

  final List<Map<String, String>> acceptedApplicants = [
    {
      'name': 'الاسم : محمد حسام',
      'program': 'البرنامج التأسيسي : 7000',
      'date': 'تاريخ الدورة : 3/3/2023',
      'image': 'assets/images/avatar.png',
    },
    {
      'name': 'الاسم : محمد حسام',
      'program': 'البرنامج',
      'date': 'تاريخ الدورة : 3/3/2023',
      'image': 'assets/images/avatar.png',
    },
    {
      'name': 'الاسم : محمد حسام',
      'program': 'البرنامج التأسيسي : 7000',
      'date': 'تاريخ الدورة : 3/3/2023',
      'image': 'assets/images/avatar.png',
    },
  ];

  final List<Map<String, String>> notAcceptedApplicants = [
    {
      'name': 'الاسم : أحمد علي',
      'program': 'البرنامج المتقدم : 5000',
      'date': 'تاريخ الدورة : 5/5/2023',
      'image': 'assets/images/avatar.png',
    },
    {
      'name': 'الاسم : خالد سعيد',
      'program': 'البرنامج الأساسي : 3000',
      'date': 'تاريخ الدورة : 7/7/2023',
      'image': 'assets/images/avatar.png',
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
            Text(
              'حالة الشباب المطلوبين',
              style: AppTextStyles.bold18,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildToggleButton(),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildApplicantsList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                  isAccepted = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: !isAccepted ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    'لم يتم القبول',
                    style: AppTextStyles.medium14.copyWith(
                      color: !isAccepted
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
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
                  isAccepted = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isAccepted ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    'تم القبول',
                    style: AppTextStyles.medium14.copyWith(
                      color: isAccepted
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
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
    final applicants = isAccepted ? acceptedApplicants : notAcceptedApplicants;

    return ListView.builder(
      key: ValueKey(isAccepted),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemCount: applicants.length,
      itemBuilder: (context, index) {
        return ApplicantCard(
          name: applicants[index]['name']!,
          program: applicants[index]['program']!,
          date: applicants[index]['date']!,
          imagePath: applicants[index]['image']!,
        );
      },
    );
  }
}

class ApplicantCard extends StatelessWidget {
  final String name;
  final String program;
  final String date;
  final String imagePath;

  const ApplicantCard({
    Key? key,
    required this.name,
    required this.program,
    required this.date,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.chevron_left,
            color: AppColors.textSecondary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: AppTextStyles.semiBold14,
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 4),
                Text(
                  program,
                  style: AppTextStyles.medium12.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: AppTextStyles.medium12.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
