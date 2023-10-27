import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/generator/generator_view.dart';
import 'package:interfaces/views/main/main_view.dart';

class CustomNavigationBar extends StatelessWidget {
  final int active;
  const CustomNavigationBar({Key? key, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return SizedBox(
        height: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                try {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MainView(),
                  ));
                } catch (e) {
                  // Manejo de excepciones: muestra un mensaje de error en caso de problemas
                  // print('Error en onTap de MainView: ${e.toString()}');
                }
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
                BarItem(title: "Generate", active: active, current: 2)
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      // Manejo de excepciones: muestra un mensaje de error en caso de problemas
      // print('Error en CustomNavigationBar: ${e.toString()}');
      return const SizedBox.shrink();
    }
  }
}

class BarItem extends StatelessWidget {
  final String title;
  final int active;
  final int current;
  const BarItem({
    Key? key,
    required this.title,
    required this.active,
    required this.current,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return GestureDetector(
        onTap: () {
          try {
            Widget renderView =
                current == 1 ? const MainView() : const GeneratorView();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => renderView,
            ));
          } catch (e) {
            // Manejo de excepciones: muestra un mensaje de error en caso de problemas
            // print('Error en onTap de BarItem: ${e.toString()}');
          }
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
                )),
          ),
        ),
      );
    } catch (e) {
      // Manejo de excepciones: muestra un mensaje de error en caso de problemas
      // print('Error en BarItem: ${e.toString()}');
      return const SizedBox
          .shrink(); // O cualquier otro comportamiento deseado en caso de error
    }
  }
}
