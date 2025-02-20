import 'package:ai_app/Features/Profile/data/repos/profile_repo_imp.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_user_data_state.dart';

class FetchUserDataCubit extends Cubit<FetchUserDataState> {
  FetchUserDataCubit(this.profileRepoImp) : super(FetchUserDataInitial());
 final ProfileRepoImp profileRepoImp;

  Future<void> fetchUserData() async {
    try {
      emit(FetchUserDataLoading());
      final result = await profileRepoImp.fetchUserData();
      result.fold((l) => emit(FetchUserDataFailure(l.errMessage)),
          (r) => emit(FetchUserDataSuccess(r)));
    } catch (e) {
      emit(FetchUserDataFailure("Failed to fetch user data"));
    }
  }
Stream<String> streamUsername() async* {
    // Assuming `state` contains the user data and has been updated previously
    if (state is FetchUserDataSuccess) {
      final userData = (state as FetchUserDataSuccess).userData;
      if (userData.isNotEmpty) {
        yield userData[0]['name'];
      } else {
        yield "UserName";
      }
    }
  }
}
