import 'package:ai_app/core/app_router.dart';
import 'package:ai_app/core/basic_methods.dart';
import 'package:ai_app/core/supabase_methods.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Settings Page'),
            TextButton(
              onPressed: () {
                try {
                  SupabaseMethods.instance.signOut();
                  BasicMethods.instance
                      .navigateToAndRemoveAll(AppRouter.loginView, context);
                } catch (e) {
                  print(e);
                }
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
