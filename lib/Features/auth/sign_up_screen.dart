import 'package:ai_app/core/app_router.dart';
import 'package:ai_app/core/basic_methods.dart';
import 'package:ai_app/core/color_manager.dart';
import 'package:ai_app/core/config_size.dart';
import 'package:ai_app/core/supabase_methods.dart';
import 'package:ai_app/core/widgets/custom_text_field.dart';
import 'package:ai_app/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  bool strongPassword = false;
  bool remember = false;
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    userName.dispose();
    mobile.dispose();
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
                  "Create an account",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                Text(
                  "Sign to a free account. Get easier than search engines results",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 5,
                ),
                Text("UserName"),
                SizedBox(
                  height: ConfigSize.defaultSize! * 1,
                ),
                CustomTextField(
                  controller: userName,
                  icon: Icons.person,
                  hintText: "Enter your User Name",
                ),
                Text("Mobile Number"),
                SizedBox(
                  height: ConfigSize.defaultSize! * 1,
                ),
                CustomTextField(
                  controller: mobile,
                  icon: Icons.phone,
                  hintText: "Enter your Phone Number",
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
                  onChange: (value) {
                    if (value.length >= 6) {
                      setState(() {
                        strongPassword = true;
                      });
                    }
                  },
                  controller: password,
                  icon: Icons.lock_outline_rounded,
                  hintText: "Enter your Password",
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: strongPassword == true,
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: ColorManager.success,
                          ),
                          SizedBox(
                            width: ConfigSize.defaultSize! * 1,
                          ),
                          Text("Strong Password",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: ColorManager.success))
                        ],
                      ),
                    ),
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
                      final response =
                          await SupabaseMethods.instance.supabase.auth.signUp(
                        email: email.text,
                        password: password.text,
                      );
                      if (response.user != null) {
                        print("User ID: ${response.user!.id}");

                        SupabaseMethods.instance.insertUser(
                          email.text,
                          password.text,
                          userName.text,
                          mobile.text,
                          response.user!.id,
                        );

                        BasicMethods.instance.navigateToAndRemoveAll(
                            AppRouter.loginView, context);
                      } else {
                        print("Sign-up failed: User is null");
                      }
                    } catch (e) {
                      print("Error: $e");
                    }
                  },
                  color: ColorManager.primary,
                  title: "Create Account",
                  height: ConfigSize.defaultSize! * 5,
                ),
                Row(
                  children: [
                    Text("Already have an account"),
                    TextButton(
                        onPressed: () {
                          BasicMethods.instance.navigateToAndRemoveAll(
                              AppRouter.loginView, context);
                        },
                        child: Text(
                          "Login",
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
