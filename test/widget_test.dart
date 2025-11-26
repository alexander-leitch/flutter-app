// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/firebase_options.dart';

// Note: Testing Firebase apps often requires mocking.
// Since I don't want to introduce complex mocking dependencies just for a basic check,
// I will just test that the app builds and shows the LoginScreen title.
// However, without mocking Firebase.initializeApp, the main() will fail or warn.
// But we can pump the widget directly.

void main() {
  testWidgets('Login screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // We wrap in MaterialApp because LoginScreen needs it.
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Verify that our login button is present.
    expect(find.text('Sign in with Google'), findsOneWidget);
    expect(find.byIcon(Icons.login), findsOneWidget);
  });
}
