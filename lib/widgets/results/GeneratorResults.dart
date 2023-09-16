// ignore_for_file: file_names

import 'package:flutter/material.dart';

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
    return const Column(children: <Widget>[
      Expanded(child: Placeholder()),
      SizedBox(
        height: 50,
      ),
      Expanded(child: Placeholder()),
    ]);
  }
}
