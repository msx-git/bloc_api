part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

/// initial state
class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

/// data loaded state
class UserLoadedState extends UserState{
  const UserLoadedState(this.users);

  final List<UserModel> users;
  @override
  List<Object?> get props => [users];

}

/// error occurred state

class UserErrorState extends UserState {
  const UserErrorState(this.errorText);
  final String errorText;
  @override
  List<Object?> get props => [errorText];
}
