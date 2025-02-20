import 'package:ai_app/core/app_router.dart';
import 'package:ai_app/core/basic_methods.dart';
import 'package:ai_app/core/color_manager.dart';
import 'package:ai_app/core/config_size.dart';
import 'package:ai_app/core/supabase_methods.dart';
import 'package:ai_app/core/widgets/custom_text_field.dart';
import 'package:ai_app/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool remember = false;
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back to login!",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                Text(
                  "Login to your account. Get easier than search engines results",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 5,
                ),
                Text("Email"),
                SizedBox(
                  height: ConfigSize.defaultSize! * 1,
                ),
                CustomTextField(
                  controller: email,
                  icon: Icons.email_outlined,
                  hintText: "Enter your Email",
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                Text("Password"),
                SizedBox(
                  height: ConfigSize.defaultSize! * 1,
                ),
                CustomTextField(
                  controller: password,
                  icon: Icons.lock_outline_rounded,
                  hintText: "Enter your Password",
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Reset Password",
                          style: TextStyle(color: ColorManager.failure),
                        ))
                  ],
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text("Remember login Info"),
                  checkColor: ColorManager.white,
                  fillColor: remember == true
                      ? WidgetStatePropertyAll<Color>(ColorManager.primary)
                      : WidgetStatePropertyAll<Color>(ColorManager.white),
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 5,
                ),
                MainButton(
                  onPressed: () async {
                    try {
                      final response = await SupabaseMethods
                          .instance.supabase.auth
                          .signInWithPassword(
                        email: email.text,
                        password: password.text,
                      );
                      if (response.user != null) {
                        BasicMethods.instance.navigateToAndRemoveAll(
                            AppRouter.homeView, context);
                      } else {
                        print("Sign-up failed");
                      }
                    } catch (e) {
                      print("Error: $e");
                    }
                  },
                  color: ColorManager.primary,
                  title: "Login",
                  height: ConfigSize.defaultSize! * 5,
                ),
                Row(
                  children: [
                    Text("Don't have an a account"),
                    TextButton(
                        onPressed: () {
                          BasicMethods.instance.navigateToAndRemoveAll(
                              AppRouter.signupView, context);
                        },
                        child: Text(
                          "Create an account",
                          style: TextStyle(color: ColorManager.primary),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
