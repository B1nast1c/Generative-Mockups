import 'package:flutter/material.dart';
import 'package:interfaces/common/api_service.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/common/image_model.dart';
import 'package:interfaces/views/main/center_view.dart';
import 'package:interfaces/views/results/results_view.dart';

class LoadingView extends StatefulWidget {
  final Function signalFunction;
  final String label;
  const LoadingView(
      {super.key, required this.signalFunction, required this.label});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  String loadText = 'Generating Layouts';
  bool redirectView = false;
  Future<List<ImageModel>>? imageModel;
  late List<ImageModel> imagesList;

  void generateImages(String label) async {
    imageModel = ApiService().generateImages(
        label); // No es necesario convertirlo a Future<List<String>>
    imageModel?.then((list) {
      if (list.isNotEmpty) {
        List<ImageModel> myList = list;
        if (mounted) {
          setState(() {
            imagesList = myList;
          });
        }
      }
    });
  }

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
    generateImages(widget.label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.normalWhite,
        body: CenterView(
            child: FutureBuilder<List<ImageModel>>(
                future: imageModel,
                builder: (context, snapshot) {
                  Future.delayed(const Duration(seconds: 3), () {
                    widget.signalFunction();
                  });
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
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
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ResultsView(
                      viewTitle: widget.label,
                      imagesList: imagesList,
                    ); //Pasado por la API (Elemento que se ha generado)
                  }
                })));
  }
}
