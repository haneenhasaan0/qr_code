import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/features/login/presentation/cubit/login/login_cubit/login_cubit.dart';
import 'package:qr_code/features/login/presentation/screen/login_screen.dart';

void main() {
  testWidgets('LoginScreen builds with its LoginCubit',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider(
              create: (context) => LoginCubit(),
              child: const LoginScreen(),
            ),
          ),
        );

        expect(find.byType(LoginScreen), findsOneWidget);
      });
}
