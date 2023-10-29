import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';

import 'test_httpclient.dart';

Future<void> main() async {
  setUpAll(() async {
    HttpOverrides.global = ApiOverrides();
  });

  testWidgets('Verificar el largo de labelList', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.runAsync(() async {
      const int expectedLength = 20;
      var response = await http.Client()
          .get(Uri.parse('http://127.0.0.1:5000/api/labels'));

      final parsedRes = jsonDecode(response.body);
      int length = parsedRes['name'].length;

      expect(response.statusCode, 200);
      expect(parsedRes, isNotEmpty);
      expect(length, expectedLength);
    });
  });
}
