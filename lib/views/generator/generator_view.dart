import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/main/center_view.dart';
import 'package:interfaces/widgets/bar/navigation/navigation_bar.dart';
import 'package:interfaces/widgets/bar/search/generator_bar.dart';
import 'package:interfaces/widgets/buttons/generate_button.dart';

class GeneratorView extends StatelessWidget {
  const GeneratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return const Scaffold(
        backgroundColor: AppColors.normalWhite,
        body: CenterView(
          child: Column(
            children: <Widget>[
              CustomNavigationBar(active: 2),
              Divider(
                color: AppColors.lightPink,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "WHAT DO YOU WANT?",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        height: 0.925,
                        fontSize: 55,
                        color: AppColors.letterColor,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GeneratorBar(),
                    SizedBox(
                      height: 25,
                    ),
                    GenerateButton(title: 'CREATE LAYOUT'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      // Manejo de excepciones: muestra un mensaje de error en caso de problemas
      return Scaffold(
        body: Center(
          child: Text('Error: ${e.toString()}'),
        ),
      );
    }
  }
}
