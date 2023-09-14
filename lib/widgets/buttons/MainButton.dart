import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';

class MainButton extends StatelessWidget {
  final String title;
  const MainButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      decoration: BoxDecoration(
          color: AppColors.normalSalmon,
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.normalWhite),
      ),
    );
  }
}
