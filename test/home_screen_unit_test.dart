import 'package:fitpage/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mockdata.dart';

void main() {
  testWidgets('HomeScreen displays "Top Gainers" on screen',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(
        mockData: appMockApiData,
      ),
    ));

    // Wait for the loading state to finish
    await tester.pump();

    // Verify if "Top Gainers" text is present on the screen
    expect(find.text('Top gainers'), findsOneWidget);
    expect(find.text('Intraday buying seen in last 15 minutes'), findsOneWidget);
   
    
  });
}
