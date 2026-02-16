import 'package:flutter/material.dart';
import 'package:my_eyezon_app/features/Criminals%20Management/presentation/views/widgets/criminal_card.dart';

class CriminalListView extends StatelessWidget {
  const CriminalListView({super.key, required this.isArrested});
  final bool isArrested;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> arrestedList = [
      {
        'name': 'محمد حسام',
        'program': '7000',
        'date': '3/3/2023',
        'image': 'assets/images/Admin_profile_image.png',
      },
      {
        'name': 'محمد حسام',
        'program': '7000',
        'date': '3/3/2023',
        'image': 'assets/images/Admin_profile_image.png',
      },
      {
        'name': 'محمد حسام',
        'program': '7000',
        'date': '3/3/2023',
        'image': 'assets/images/Admin_profile_image.png',
      },
    ];

    final List<Map<String, String>> notArrestedList = [
      {
        'name': 'محمد حسام',
        'program': '7000',
        'date': '3/3/2023',
        'image': 'assets/images/Admin_profile_image.png',
      },
      {
        'name': 'محمد حسام',
        'program': '7000',
        'date': '3/3/2023',
        'image': 'assets/images/Admin_profile_image.png',
      },
    ];
    final lists = isArrested ? arrestedList : notArrestedList;
    return ListView.builder(
      key: ValueKey(isArrested),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemCount: lists.length,
      itemBuilder: (context, index) {
        return CriminalCard(
          name: lists[index]['name']!,
          serialNumber: lists[index]['program']!,
          crimeDate: lists[index]['date']!,
          imagePath: lists[index]['image']!,
        );
      },
    );
    ;
  }
}
