import 'package:flutter/material.dart';

class LeftView extends StatelessWidget {
  final Widget child;

  const LeftView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    try {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: child,
        ),
      );
    } catch (e) {
      // Manejo de excepciones: muestra un mensaje de error en caso de problemas
      return Container(
        alignment: Alignment.center,
        child: Text('Error: ${e.toString()}'),
      );
    }
  }
}
