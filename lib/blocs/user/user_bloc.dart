import 'package:bloc_api/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _repository;
  UserBloc(this._repository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try{
        final List<UserModel> users = await _repository.getUsers();
        emit(UserLoadedState(users));
      }catch(e){
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
