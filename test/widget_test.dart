import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cricket_scorer_app/main.dart';

void main() {
  testWidgets('Welcome screen shows two buttons', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Look for the text buttons
    expect(find.text('Connect with Google'), findsOneWidget);
    expect(find.text('Continue as Guest'), findsOneWidget);

    // Optionally, check if the image (logo) is rendered
    expect(find.byType(Image), findsOneWidget);
  });
}
