import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/core/widget/custom_form_field.dart';
import 'package:qr_code/core/widget/password_form_field.dart';

class SignInView extends StatelessWidget {
   SignInView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black,offset: Offset(0, 3),
            blurRadius: 16)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "تسجيل دخول",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
                ),
                SizedBox(height: 12,),
                Text("من فضلك ادخل ال id"),
                SizedBox(height: 4),
                CustomFormField(
                  fillColor: Colors.white,
                  hintText: "ID",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "من فضلك ادخل رقم id";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24,),
                Text("من فضلك ادخل كلمة المرور"),
                SizedBox(height: 4),

                PasswordTextFormField(
                  hintText: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "من فضلك ادخل كلمة المرور";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8,),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                     context.go('/main');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("تسجيل دخول"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
