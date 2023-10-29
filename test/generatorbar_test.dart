import 'package:flutter_test/flutter_test.dart';
import 'package:interfaces/main.dart';
import 'package:interfaces/widgets/bar/search/generator_bar.dart';

void main() {
  testWidgets('Verificar el largo de labelList', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    final GeneratorBarState barState =
        tester.state(find.byType(const GeneratorBar() as Type));
    const int expectedLenght = 20;

    expect(barState.getLabels(), expectedLenght);
  });
}
