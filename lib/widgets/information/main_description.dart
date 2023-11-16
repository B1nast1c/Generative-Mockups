import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/widgets/buttons/main_button.dart';

class MainDescription extends StatelessWidget {
  static const startButton = Key("StartButton");
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
              "LAYOUT \nGENERATOR",
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
              "Piensa en una frase mejor XD",
              style: TextStyle(
                  fontSize: 16, height: 1.5, color: AppColors.letterColor),
            ),
            SizedBox(
              height: 20,
            ),
            MainButton(key: startButton, title: "LET'S START")
          ]),
    );
  }
}
