import 'package:flutter/material.dart';

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
              "MOCKUPS \nGENERATOR",
              style: TextStyle(
                  fontWeight: FontWeight.w800, height: 0.9, fontSize: 80),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Descripción a Futuro",
              style: TextStyle(fontSize: 18, height: 1.7),
            )
          ]),
    );
  }
}
