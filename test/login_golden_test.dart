import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mp_lab14/login_screen.dart';

void main() {
  testWidgets('LoginScreen golden test', (WidgetTester tester) async {
    // Wrap with MaterialApp to avoid missing theme/media queries
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    await tester.pumpAndSettle();

    // Compare UI to stored golden image
    await expectLater(
      find.byType(LoginScreen),
      matchesGoldenFile('goldens/login_screen.png'),
    );
  });
}
