import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/main/CenterView.dart';
import 'package:interfaces/widgets/bar/navigation/NavigationBar.dart';
import 'package:interfaces/widgets/information/MainDescription.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.normalWhite,
      body: CenterView(
          child: Column(
        children: <Widget>[
          const CustomNavigationBar(active: 1),
          const Divider(
            color: AppColors.lightPink,
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              const MainDescription(),
              Expanded(
                  child: Center(
                child: Image.asset('assets/mainImage.png'),
              ))
            ],
          ))
        ],
      )),
    );
  }
}
