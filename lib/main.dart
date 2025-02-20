import 'package:ai_app/Features/Profile/presentation/cubits/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:ai_app/Features/nav_bar_view.dart';
import 'package:ai_app/core/app_router.dart';
import 'package:ai_app/core/bloc_observer.dart';
import 'package:ai_app/core/color_manager.dart';
import 'package:ai_app/core/config_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import "package:ai_app/core/service_locator.dart" as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver(); // Set the custom BlocObserver
  await GetStorage.init(); // Initialize GetStorage
  await di.init();
  await Supabase.initialize(
      url: 'https://jwhddygfloyutkgqjhfz.supabase.co',
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp3aGRkeWdmbG95dXRrZ3FqaGZ6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg2NTg0NzYsImV4cCI6MjA1NDIzNDQ3Nn0.7McD3tZ8v0_bos43HtZ095J_lM7TXg3ZEXe7Jo84v-M");
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.getIt<FetchUserDataCubit>()..fetchUserData(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // scaffoldBackgroundColor: ColorManager.button.withOpacity(0.8),
          useMaterial3: true,
        ),
      ),
    );
  }
}
