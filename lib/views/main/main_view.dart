import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/main/center_view.dart';
import 'package:interfaces/widgets/bar/navigation/navigation_bar.dart';
import 'package:interfaces/widgets/information/main_description.dart';

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
