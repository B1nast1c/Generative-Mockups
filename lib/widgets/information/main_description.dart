import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/widgets/buttons/main_button.dart';

class MainDescription extends StatelessWidget {
  const MainDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 600,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "GENERADOR DE \nMOCKUPS",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  height: 0.9,
                  fontSize: 80,
                  color: AppColors.letterColor),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Transforma tus conceptos en diseños asombrosos: nuestra página web genera mockups en base a tus ideas y palabras",
              style: TextStyle(
                  fontSize: 15, height: 1.5, color: AppColors.letterColor),
            ),
            SizedBox(
              height: 20,
            ),
            MainButton(title: 'EMPEZAR')
          ]),
    );
  }
}
