import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/main/center_view.dart';
import 'package:interfaces/widgets/bar/navigation/navigation_bar.dart';
import 'package:interfaces/widgets/bar/search/generator_bar.dart';
import 'package:interfaces/widgets/buttons/generate_button.dart';

class GeneratorView extends StatefulWidget {
  const GeneratorView({super.key});

  @override
  State<GeneratorView> createState() => _GeneratorViewState();
}

class _GeneratorViewState extends State<GeneratorView> {
  String labelButton = "";

  void updateData(String newData) {
    setState(() {
      labelButton = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: AppColors.normalWhite,
          body: CenterView(
            child: Column(
              children: <Widget>[
                const CustomNavigationBar(active: 2),
                const Divider(
                  color: AppColors.lightPink,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "WHICH LAYOUT TOPIC DO YOU WANT?",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          height: 0.925,
                          fontSize: 60,
                          color: AppColors.letterColor,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SingleChildScrollView(
                        child: GeneratorBar(callback: updateData),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GenerateButton(
                          title: 'CREATE LAYOUT', label: labelButton),
                    ],
                  ),
                ),
              ],
            ),
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
