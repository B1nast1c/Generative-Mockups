import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/widgets/buttons/download_button.dart';
import 'package:interfaces/widgets/buttons/share_button.dart';
import 'package:interfaces/common/image_model.dart';

class GeneratorResults extends StatelessWidget {
  final List<ImageModel> items;
  const GeneratorResults({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(top: 90, bottom: 85, right: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ResultsElement(
                elementId: 0,
                items: items,
              )),
              const SizedBox(
                width: 50,
              ),
            ],
          )),
    );
  }
}

class ResultsElement extends StatelessWidget {
  final int elementId;
  final List<ImageModel> items;
  const ResultsElement(
      {super.key, required this.elementId, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: GestureDetector(
              onTap: () {
                showInfo(context, elementId, items);
              },
              child: const MouseRegion(
                  cursor: SystemMouseCursors.click, child: Placeholder()))),
      const SizedBox(
        width: 70,
      ),
      Expanded(
        child: GestureDetector(
            onTap: () {
              showInfo(context, elementId + 1, items);
            },
            child: const MouseRegion(
                cursor: SystemMouseCursors.click, child: Placeholder())),
      )
    ]);
  }
}

showInfo(context, id, items) {
  ImageModel item = items[id];
  id = id + 1;
  String base64String = item.image;
  List<int> imageBytes = base64Decode(base64String);

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
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, bottom: 40, top: 60),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.memory(
                                    Uint8List.fromList(imageBytes)),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Layout nº $id',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    height: 0.9,
                                    fontSize: 50,
                                    color: AppColors.letterColor),
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const Text('Layout info: ',
                                              style: TextStyle(
                                                  height: 2.5,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      AppColors.letterColor)),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Text(
                                              'Within this sample, various elements can be observed that reflect the capability of a GAN in image generation.'),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          const Text('Layout data: ',
                                              style: TextStyle(
                                                  height: 2.5,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      AppColors.letterColor)),
                                          Text('Name: ${item.name}',
                                              style: const TextStyle(
                                                  fontSize: 11)),
                                          Text('Label: ${item.label}',
                                              style: const TextStyle(
                                                  fontSize: 11)),
                                          Text('Resolution: ${item.resolution}',
                                              style: const TextStyle(
                                                  fontSize: 11)),
                                        ]),
                                  ),
                                  Container(
                                    color: AppColors.normalWhite,
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        DownloadButton(
                                            title: 'Download layout'),
                                        SizedBox(height: 15),
                                        ShareButton(title: 'Share layout')
                                      ],
                                    ),
                                  )
                                ]),
                          ))
                    ]),
              ),
            ),
          ),
        );
      });
}
