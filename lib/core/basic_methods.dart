import 'package:ai_app/Features/Profile/presentation/cubits/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BasicMethods {
//singleton class
  BasicMethods._internal();

  // static final GetStorage getStorage = GetStorage();
  static final instance = BasicMethods._internal();

  factory BasicMethods() => instance;


  void navigateTo(String routeName, BuildContext context) {
    context.push(routeName);
  }

  void navigateToAndRemoveAll(String routeName, BuildContext context) {
    context.go(routeName);
  }

  void popPage(BuildContext context) {
    context.pop();
  }

  String fetch_current_languagecode(BuildContext context) {
    String localetype = Localizations.localeOf(context).languageCode;
    return localetype;
  }


  List<Map<String,dynamic>> getuserData(context){
    
      FetchUserDataCubit userDatabloc =
        BlocProvider.of<FetchUserDataCubit>(context);
    FetchUserDataState successstate = userDatabloc.state;
    return (successstate is FetchUserDataSuccess)
        ? successstate.userData
        : [];
  
  }

  String getuserName(context){
if (BasicMethods.instance.getuserData(context).isNotEmpty) {
  return BasicMethods.instance.getuserData(context)[0]['name'];
} else {
  return "UserName";
}
}
}
