import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:login_form/home_screen.dart';
import 'package:login_form/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end test', () {
    testWidgets('Verify login screen with correct username and password', (
      tester,
    ) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(0), 'username');
      await tester.enterText(find.byType(TextFormField).at(1), 'password');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });


    testWidgets('Verify login screen with incorrect username and password', (
      tester,
    ) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(0), 'jatin');
      await tester.enterText(find.byType(TextFormField).at(1), '12345678');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      
      expect(find.byType(AlertDialog), findsOneWidget);
    });
  });
}
