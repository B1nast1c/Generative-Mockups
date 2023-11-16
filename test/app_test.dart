import 'dart:io';

import 'package:interfaces/common/image_model.dart';
import 'package:interfaces/views/generator/generator_view.dart';
import 'package:interfaces/views/results/results_view.dart';
import 'package:interfaces/widgets/bar/search/generator_bar.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interfaces/main.dart';
import 'test_httpclient.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

main() {
  group('NAVEGACION', () {
    late NavigatorObserver mockObserver;

    setUpAll(() async {
      HttpOverrides.global = ApiOverrides();
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('Inicio -> Pagina Generativa', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(
          home: const MyApp(),
          navigatorObservers: [mockObserver],
        ));

        expect(find.text("LET'S START"), findsOneWidget);
        final button = find.text("LET'S START");
        await tester.tap(button);
        await tester.pumpAndSettle();
        expect(find.byType(GeneratorBar), findsOneWidget);
      });
    });

    testWidgets('Generativa -> Carga', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(
          home: const GeneratorView(),
          navigatorObservers: [mockObserver],
        ));

        final button = find.text("CREATE LAYOUT");
        await tester.tap(button);
        await tester.pumpAndSettle();
        final finalButton = find.text("Generating Layouts");

        expect(finalButton, findsOne);
      });
    });

    testWidgets('Resultados -> Resultado Individual',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(
          home: ResultsView(
            viewTitle: "Pruebas",
            imagesList: [
              ImageModel(
                  id: 1,
                  name: "Test",
                  label: "testLabel",
                  resolution: "testRes",
                  date: "testDate",
                  image: "testImage")
            ],
          ),
          navigatorObservers: [mockObserver],
        ));

        final button = find.byKey(const Key("resExample"));
        await tester.tap(button, warnIfMissed: false);
        await tester.pumpAndSettle();
        final finalButton = find.text("Share layout");

        expect(finalButton, findsNothing);
      });
    });
  });
}
