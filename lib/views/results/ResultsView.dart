// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/main/LeftView.dart';
import 'package:interfaces/widgets/bar/navigation/NavigationBar.dart';
import 'package:interfaces/widgets/information/ResultsPrompt.dart';
import 'package:interfaces/widgets/results/GeneratorResults.dart';

class ResultsView extends StatelessWidget {
  final String viewTitle;
  const ResultsView({super.key, required this.viewTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.normalWhite,
      body: LeftView(
          child: Column(
        children: <Widget>[
          const CustomNavigationBar(active: 2),
          const Divider(
            color: AppColors.lightPink,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  children: <Widget>[
                    ResultsPrompt(inputText: viewTitle),
                    const SizedBox(width: 100),
                    const GeneratorResults()
                  ],
                )),
          )
        ],
      )),
    );
  }
}
