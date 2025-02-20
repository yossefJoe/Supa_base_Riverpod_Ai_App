import 'package:ai_app/Features/Profile/presentation/views/pages/profile_page.dart';
import 'package:ai_app/Features/Settings/settings_page.dart';
import 'package:ai_app/Features/auth/login_screen.dart';
import 'package:ai_app/Features/auth/sign_up_screen.dart';
import 'package:ai_app/Features/nav_bar_view.dart';
import 'package:ai_app/core/supabase_methods.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homeView = '/NavBarView';
  static const loginView = '/login';
  static const signupView = '/signup';
  static const profile = '/profile';
  static const settings = '/settings';

  static final router = GoRouter(
    initialLocation: '/', // The initial route

    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            SupabaseMethods.instance.supabase.auth.currentUser != null
                ? NavBarView()
                : LoginScreen(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signupView,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const NavBarView(),
      ),
      GoRoute(
        path: settings,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => const ProfilePage(),
      ),

      GoRoute(
        path: settings,
        builder: (context, state) {
          return const NavBarView();
        },
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 300),
            child: const NavBarView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Slide transition
              var slideAnimation =
                  Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                      .animate(animation);
              return SlideTransition(position: slideAnimation, child: child);
            },
          );
        },
      ),
      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SimilarBooksCubit(
      //       getIt.get<HomeRepoImpl>(),
      //     ),
      //     child: BookDetailsView(
      //       bookModel: state.extra as BookModel,
      //     ),
      //   ),
      // ),
    ],
  );
}
