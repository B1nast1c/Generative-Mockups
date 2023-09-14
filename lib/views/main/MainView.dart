import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/main/CenterView.dart';
import 'package:interfaces/widgets/bar/navigation/NavigationBar.dart';
import 'package:interfaces/widgets/buttons/MainButton.dart';
import 'package:interfaces/widgets/information/MainDescription.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.normalWhite,
      body: CenterView(
          child: Column(
        children: <Widget>[
          CustomNavigationBar(),
          Expanded(
              child: Row(
            children: <Widget>[
              MainDescription(),
              Expanded(
                  child: Center(
                child: MainButton(title: 'Generar Mockups'),
              ))
            ],
          ))
        ],
      )),
    );
  }
}
