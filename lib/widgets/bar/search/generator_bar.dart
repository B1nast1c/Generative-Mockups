import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';

class GeneratorBar extends StatefulWidget {
  const GeneratorBar({Key? key}) : super(key: key);

  @override
  State<GeneratorBar> createState() => _GeneratorBarState();
}

class _GeneratorBarState extends State<GeneratorBar> {
  TextEditingController textController = TextEditingController();
  String inputText = "";

  @override
  void dispose() {
    try {
      textController.dispose();
    } catch (e) {
      // Manejo de excepciones: muestra un mensaje de error en caso de problemas
      // print('Error en dispose de GeneratorBar: ${e.toString()}');
    }
    super.dispose();
  }

  void inputTextChanged(String newText) {
    setState(() {
      try {
        inputText = newText;
      } catch (e) {
        // Manejo de excepciones: muestra un mensaje de error en caso de problemas
        // print('Error en inputTextChanged de GeneratorBar: ${e.toString()}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: TextField(
          controller: textController,
          onChanged: inputTextChanged,
          decoration: InputDecoration(
            hintText: 'Wanna see a layout of...',
            hintStyle: const TextStyle(color: AppColors.letterColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  const BorderSide(color: AppColors.normalPink, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  const BorderSide(color: AppColors.normalSalmon, width: 0.5),
            ),
            prefixIcon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkBlue,
            ),
          ),
        ),
      );
    } catch (e) {
      // Manejo de excepciones: muestra un mensaje de error en caso de problemas
      // print('Error en build de GeneratorBar: ${e.toString()}');
      return const SizedBox
          .shrink(); // O cualquier otro comportamiento deseado en caso de error
    }
  }
}
