
import 'package:ai_app/Features/Profile/data/repos/profile_repo_imp.dart';
import 'package:ai_app/Features/Profile/presentation/cubits/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:ai_app/core/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Api Service
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // Home Repo

  getIt.registerSingleton<ProfileRepoImp>(ProfileRepoImp(
  ));
 

  // Cubits

  getIt.registerSingleton<FetchUserDataCubit>(
      FetchUserDataCubit(getIt.get<ProfileRepoImp>()));
 

}
