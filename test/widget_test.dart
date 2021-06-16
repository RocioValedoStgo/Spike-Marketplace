import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pageview_app/src/pages/login.dart';
import 'package:pageview_app/src/pages/register.dart';

Widget createWidgetForTesting({Widget child}) {
  return MaterialApp(
    home: child,
  );
}

void main() {
  testWidgets('Login page tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(createWidgetForTesting(child: new Login()));

    // Verify text in the Login page.
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
    expect(find.text('Sign up'), findsNothing);
    expect(find.text('Create an account'), findsOneWidget);
  });

  testWidgets('Sign up page tests', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(createWidgetForTesting(child: new Register()));

    // Verify text in the Sign up page
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Please enter your username'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
    expect(find.text('Sign In'), findsNothing);
  });
}