// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';

class DownloadButton extends StatelessWidget {
  final String title;
  const DownloadButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Descargar XD');
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          decoration: BoxDecoration(
              color: AppColors.normalSalmon,
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.letterColor), //Hover a las letras blancas
          ),
        ),
      ),
    );
  }
}
