import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/widget/custom_form_field.dart';
import 'package:qr_code/core/widget/password_form_field.dart';
import '../cubit/login/login_cubit/login_cubit.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:
           Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 3),
                    blurRadius: 16,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "تسجيل دخول",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(fontSize: 20),
                      ),
                      SizedBox(height: 12),
                      Text("من فضلك ادخل ال id"),
                      SizedBox(height: 4),
                      CustomFormField(
                        controller: cubit.id,
                        fillColor: Colors.white,
                        hintText: "ID",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "من فضلك ادخل رقم id";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24),
                      Text("من فضلك ادخل كلمة المرور"),
                      SizedBox(height: 4),
                      PasswordTextFormField(
                        controller: cubit.password,
                        hintText: "Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "من فضلك ادخل كلمة المرور";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.login();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("تسجيل دخول"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
           ));
          }
}
