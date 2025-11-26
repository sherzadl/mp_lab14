import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mp_lab14/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Sign-in flow shows success', (tester) async {
    // 1) Launch app
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // 2) Find login fields + button by key
    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final loginButton = find.byKey(const Key('loginButton'));

    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(loginButton, findsOneWidget);

    // 3) Enter valid credentials
    await tester.enterText(emailField, 'test@mail.com');
    await tester.enterText(passwordField, '123456');
    await tester.pumpAndSettle();

    // 4) Tap login button
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // 5) Success proof: SnackBar appears
    expect(find.text('Login OK'), findsOneWidget);
  });
}
