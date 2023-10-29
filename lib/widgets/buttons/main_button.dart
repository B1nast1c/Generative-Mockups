import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/generator/generator_view.dart';

class MainButton extends StatelessWidget {
  final String title;
  const MainButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('btnStart'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const GeneratorView(),
        ));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
          decoration: BoxDecoration(
              color: AppColors.normalSalmon,
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.normalWhite),
          ),
        ),
      ),
    );
  }
}
