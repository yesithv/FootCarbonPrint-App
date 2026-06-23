import 'package:flutter_test/flutter_test.dart';
import 'package:foot_carbon_print/main.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setUpAll(() {
    // Prevent google_fonts from making HTTP requests during tests,
    // which leaves timers pending and causes "Timer still pending" failures.
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('App launches smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FootCarbonPrintApp());
    await tester.pumpAndSettle();
  });
}
