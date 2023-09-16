import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';

class GenerateButton extends StatelessWidget {
  final String title;
  const GenerateButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        decoration: BoxDecoration(
            color: AppColors.normalPink,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.normalBlue),
        ),
      ),
    );
  }
}
