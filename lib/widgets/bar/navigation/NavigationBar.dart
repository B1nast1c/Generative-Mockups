import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //Diseño del Logo pegar código: child: Image.asset(ubicacion)
          SizedBox(height: 80, width: 150),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BarItem(title: "Home"),
              SizedBox(width: 60),
              BarItem(title: "Generate")
            ],
          )
        ],
      ),
    );
  }
}

class BarItem extends StatelessWidget {
  final String title;
  const BarItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18),
    );
  }
}
