import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/loader/loading_view.dart';

class GenerateButton extends StatelessWidget {
  final String title;
  final String label;
  const GenerateButton({super.key, required this.title, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('btnGenerate'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoadingView(
            signalFunction: () {
              log("Carga de las imágenes generadas");
            },
            label: label,
          ),
        ));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          decoration: BoxDecoration(
              color: AppColors.normalSalmon,
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.letterColor), //Hover a las letras blancas
          ),
        ),
      ),
    );
  }
}
