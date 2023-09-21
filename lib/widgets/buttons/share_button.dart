import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';

class ShareButton extends StatelessWidget {
  final String title;
  const ShareButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Compartir XD');
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          decoration: BoxDecoration(
              color: AppColors.letterColor,
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.normalSalmon), //Hover a las letras blancas
          ),
        ),
      ),
    );
  }
}
