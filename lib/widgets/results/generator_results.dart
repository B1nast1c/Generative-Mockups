import 'package:flutter/material.dart';
import 'package:interfaces/common/colors.dart';
import 'package:interfaces/widgets/buttons/download_button.dart';
import 'package:interfaces/widgets/buttons/share_button.dart';

class GeneratorResults extends StatelessWidget {
  const GeneratorResults({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
          padding: EdgeInsets.only(top: 90, bottom: 50, right: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ResultsElement(
                elementId: 1,
              )),
              SizedBox(
                width: 50,
              ),
              Expanded(
                  child: ResultsElement(
                elementId: 3,
              ))
            ],
          )),
    );
  }
}

class ResultsElement extends StatelessWidget {
  final int elementId;
  const ResultsElement({super.key, required this.elementId});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
          child: GestureDetector(
              onTap: () {
                showInfo(context, 'Titulo 1', elementId);
              },
              child: const MouseRegion(
                  cursor: SystemMouseCursors.click, child: Placeholder()))),
      const SizedBox(
        height: 50,
      ),
      Expanded(
        child: GestureDetector(
            onTap: () {
              showInfo(context, 'Titulo 1', elementId + 1);
            },
            child: const MouseRegion(
                cursor: SystemMouseCursors.click, child: Placeholder())),
      )
    ]);
  }
}

showInfo(context, title, id) {
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
                              const Expanded(child: Placeholder()),
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
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Layout code: $title',
                                              style: const TextStyle(
                                                  height: 2.5,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      AppColors.letterColor)),
                                          const Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
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
