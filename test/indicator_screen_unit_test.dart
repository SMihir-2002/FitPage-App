
import 'package:fitpage/screens/indicator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mockdata.dart';

void main() {
  testWidgets('Criteria Screen', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
        home:IndicatorScreen(
          indicatorData: appMockApiData[3]["criteria"][0]["variable"]["\$1"]),
    ));

    // Wait for the loading state to finish
    await tester.pump();

    // Verify if "Top Gainers" text is present on the screen
    expect(find.text('period'), findsOneWidget);
  });
}
