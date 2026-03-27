import 'package:flutter_test/flutter_test.dart';
import 'package:cva_training/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CVATrainingApp());
    expect(find.text('CVA Training'), findsOneWidget);
  });
}
