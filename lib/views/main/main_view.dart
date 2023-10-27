import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/main/center_view.dart';
import 'package:interfaces/widgets/bar/navigation/navigation_bar.dart';
import 'package:interfaces/widgets/information/main_description.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Validación de recursos

    return Scaffold(
      backgroundColor: AppColors.normalWhite,
      body: CenterView(
          child: Column(
        children: <Widget>[
          // Validación de contenido estático
          const CustomNavigationBar(active: 1),
          const Divider(
            color: AppColors.lightPink,
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              // Validación de contenido estático
              const MainDescription(),
              Expanded(
                  child: Center(
                // Validación de contenido estático
                child: Image.asset('assets/mainImage.png'),
              ))
            ],
          ))
        ],
      )),
    );
  }
}
