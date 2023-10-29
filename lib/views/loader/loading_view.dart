import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/views/main/center_view.dart';
import 'package:interfaces/views/results/results_view.dart';

class LoadingView extends StatefulWidget {
  final Function signalFunction;
  const LoadingView({super.key, required this.signalFunction});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  String loadText = 'Generating Layouts';
  bool redirectView = false;

  void loadingText() {
    const duration = Duration(seconds: 1);
    int dotCount = 0;

    Future.delayed(duration, () {
      if (mounted) {
        setState(() {
          if (dotCount < 3) {
            loadText += '.';
            dotCount++;
          } else {
            loadText = 'Generating Layouts';
            dotCount = 0;
          }
        });
        loadingText();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadingText();
    Future.delayed(const Duration(seconds: 3), () {
      try {
        widget.signalFunction();
        setState(() {
          redirectView = true;
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const ResultsView(
                    viewTitle:
                        'Modificar', //Pasado por la API (Elemento que se ha generado)
                  )));
        });
      } catch (e) {
        // Manejo de excepciones: muestra un mensaje de error en caso de problemas
        setState(() {
          loadText = 'Error: ${e.toString()}';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.normalWhite,
      body: CenterView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset(
            'assets/loader.gif',
            width: 225,
            height: 225,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            loadText,
            style: const TextStyle(
                fontSize: 14,
                color: AppColors.letterColor,
                fontWeight: FontWeight.w700),
          )
        ],
      )),
    );
  }
}
