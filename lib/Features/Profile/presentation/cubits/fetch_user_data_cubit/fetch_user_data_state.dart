part of 'fetch_user_data_cubit.dart';

sealed class FetchUserDataState extends Equatable {
  const FetchUserDataState();

  @override
  List<Object> get props => [];
}

final class FetchUserDataInitial extends FetchUserDataState {}

final class FetchUserDataLoading extends FetchUserDataState {}

final class FetchUserDataSuccess extends FetchUserDataState {
  final List<Map<String, dynamic>> userData;
    const FetchUserDataSuccess(this.userData);

}

class FetchUserDataFailure extends FetchUserDataState {
  final String errMessage;

  const FetchUserDataFailure(this.errMessage);
}
