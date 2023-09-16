// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/generator/GeneratorView.dart';
import 'package:interfaces/views/main/MainView.dart';

class CustomNavigationBar extends StatelessWidget {
  final int active;
  const CustomNavigationBar({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MainView(),
              ));
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: SizedBox(
                height: 85,
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BarItem(title: "Home", active: active, current: 1),
              const SizedBox(width: 25),
              BarItem(title: "Generar", active: active, current: 2)
            ],
          ),
        ],
      ),
    );
  }
}

class BarItem extends StatelessWidget {
  final String title;
  final int active;
  final int current;
  const BarItem(
      {super.key,
      required this.title,
      required this.active,
      required this.current});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Widget renderView =
            current == 1 ? const MainView() : const GeneratorView();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => renderView,
        ));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            color: current == active
                ? AppColors.normalSalmon
                : AppColors.normalWhite,
            child: Text(title,
                style: TextStyle(
                  fontSize: 16,
                  color: current == active
                      ? AppColors.normalWhite
                      : AppColors.letterColor,
                  fontWeight:
                      current == active ? FontWeight.bold : FontWeight.normal,
                ))),
      ),
    );
  }
}
