// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';

class GeneratorBar extends StatefulWidget {
  const GeneratorBar({super.key});

  @override
  State<GeneratorBar> createState() => _GeneratorBarState();
}

class _GeneratorBarState extends State<GeneratorBar> {
  TextEditingController textController = TextEditingController();
  String inputText = "";

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void inputTextChanged(String newText) {
    setState(() {
      inputText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: TextField(
        controller: textController,
        onChanged: inputTextChanged,
        decoration: InputDecoration(
            hintText: 'Desearia un mockup de...',
            hintStyle: const TextStyle(color: AppColors.letterColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  const BorderSide(color: AppColors.normalPink, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                    color: AppColors.normalSalmon, width: 0.5)),
            prefixIcon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkBlue,
            )),
      ),
    );
  }
}
