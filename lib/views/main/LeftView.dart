// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LeftView extends StatelessWidget {
  final Widget child;
  const LeftView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: child,
      ),
    );
  }
}
