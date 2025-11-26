import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mp_lab14/login_screen.dart';

void main() {
  testWidgets('Login validation works', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: LoginScreen()),
    );

    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final loginButton = find.byKey(const Key('loginButton'));

    await tester.tap(loginButton);
    await tester.pump();

    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);

    await tester.enterText(emailField, 'wrong');
    await tester.enterText(passwordField, '123456');
    await tester.tap(loginButton);
    await tester.pump();

    expect(find.text('Enter a valid email'), findsOneWidget);
  });
}
