import 'package:flutter_test/flutter_test.dart';
import 'package:foot_carbon_print/main.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FootCarbonPrintApp());
    await tester.pump();
  });
}
