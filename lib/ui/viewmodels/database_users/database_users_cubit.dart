import 'package:bus2_teste_tecnico/data/repositories/database_users_repository/database_users_repository.dart';
import 'package:bus2_teste_tecnico/ui/viewmodels/database_users/database_users.states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatabaseUsersCubit extends Cubit<DatabaseUsersState> {
  final DatabaseUsersRepository _repository;

  DatabaseUsersCubit(this._repository) : super(DatabaseUsersInitialState());

  void fetchUsers() async {
    emit(FetchDatabaseUsersLoadingState());
    final result = await _repository.fetchUsers();
    if (result.success) {
      /// Tempo para mostrar o loading
      await Future.delayed(const Duration(seconds: 1));
      emit(FetchDatabaseUsersSuccessState(result.data!));
      return;
    } else {
      emit(FetchDatabaseUsersErrorState(result.error));
    }
  }

  void saveUser(user) async {
    emit(SaveDatabaseUserLoadingState());
    final result = await _repository.saveUser(user);
    if (result.success) {
      emit(SaveDatabaseUserSuccessState());
      return;
    } else {
      emit(SaveDatabaseUserErrorState(result.error));
    }
  }

  void clear() async {
    emit(ClearDatabaseUserLoadingState());
    final result = await _repository.clearUsers();
    if (result.success) {
      emit(ClearDatabaseUserSuccessState());
      return;
    } else {
      emit(ClearDatabaseUserErrorState(result.error));
    }
  }
}
