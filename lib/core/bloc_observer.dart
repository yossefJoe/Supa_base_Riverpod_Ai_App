import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('Bloc Change: ${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('Bloc Error: ${bloc.runtimeType} $error');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, dynamic event) {
    super.onEvent(bloc, event);
    print('Bloc Event: ${bloc.runtimeType} $event');
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    print('Bloc Transition: ${bloc.runtimeType} $transition');
  }
}
