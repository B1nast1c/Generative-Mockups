// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';

class GeneratorResults extends StatelessWidget {
  const GeneratorResults({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
          padding: EdgeInsets.only(top: 90, bottom: 50, right: 10),
          child: Row(
            children: <Widget>[
              Expanded(child: ResultsElement()),
              SizedBox(
                width: 50,
              ),
              Expanded(child: ResultsElement())
            ],
          )),
    );
  }
}

class ResultsElement extends StatelessWidget {
  const ResultsElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
          child: GestureDetector(
              onTap: () {
                showInfo(context, 'Titulo 1');
              },
              child: const MouseRegion(
                  cursor: SystemMouseCursors.click, child: Placeholder()))),
      const SizedBox(
        height: 50,
      ),
      Expanded(
        child: GestureDetector(
            onTap: () {
              showInfo(context, 'Titulo 1');
            },
            child: const MouseRegion(
                cursor: SystemMouseCursors.click, child: Placeholder())),
      )
    ]);
  }
}

showInfo(context, title) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: AppColors.normalWhite),
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.85,
            ),
          ),
        );
      });
}
