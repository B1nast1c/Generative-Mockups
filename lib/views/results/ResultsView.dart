import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/main/CenterView.dart';
import 'package:interfaces/widgets/bar/navigation/NavigationBar.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Placeholder(),
          )
        ],
      )),
    );
  }
}
