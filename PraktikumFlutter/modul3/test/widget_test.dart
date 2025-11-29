import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:modul3/main.dart';

void main() {
  testWidgets('Login page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LoginApp());

    // Verify that login page elements are present
    expect(find.text('Login Page'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
  });
}
