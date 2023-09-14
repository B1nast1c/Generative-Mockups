import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 150,
            width: 220,
            child: Image.asset('assets/logo.png'),
          ),
          const Row(
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
      style: const TextStyle(fontSize: 16),
    );
  }
}
