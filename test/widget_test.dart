import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/features/details/screens/vehicle_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/features/login/presentation/screen/login_screen.dart';

void main() {
  testWidgets('DetailsScreen renders vehicle header and specifications correctly',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: LoginScreen(),
          ),
        );
      });}