import "package:bus2_teste_tecnico/data/models/user/user_model.dart";
import "package:equatable/equatable.dart";

import "../../../core/errors/base_error.dart";
import "../../../core/errors/http_errors.dart";

sealed class DatabaseUsersState extends Equatable {}

class DatabaseUsersInitialState<T> implements DatabaseUsersState {
  final T? data;

  const DatabaseUsersInitialState([this.data]);

  @override
  List<Object?> get props => [data];

  @override
  bool get stringify => false;
}

class FetchDatabaseUsersLoadingState implements DatabaseUsersState {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class FetchDatabaseUsersSuccessState implements DatabaseUsersState {
  final List<UserModel> data;

  const FetchDatabaseUsersSuccessState(this.data);

  @override
  List<Object?> get props => [data];

  @override
  bool get stringify => false;
}

class FetchDatabaseUsersErrorState<T> implements DatabaseUsersState {
  final BaseError error;

  FetchDatabaseUsersErrorState(BaseError? e)
    : error = e ?? UnknownError(message: "Ocorreu um erro desonhecido");

  @override
  List<Object?> get props => [error];

  @override
  bool get stringify => false;
}

class SaveDatabaseUserLoadingState implements DatabaseUsersState {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class SaveDatabaseUserSuccessState implements DatabaseUsersState {
  const SaveDatabaseUserSuccessState();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class SaveDatabaseUserErrorState<T> implements DatabaseUsersState {
  final BaseError error;

  SaveDatabaseUserErrorState(BaseError? e)
    : error = e ?? UnknownError(message: "Ocorreu um erro desonhecido");

  @override
  List<Object?> get props => [error];

  @override
  bool get stringify => false;
}

class ClearDatabaseUserLoadingState implements DatabaseUsersState {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class ClearDatabaseUserSuccessState implements DatabaseUsersState {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class ClearDatabaseUserErrorState<T> implements DatabaseUsersState {
  final BaseError error;

  ClearDatabaseUserErrorState(BaseError? e)
    : error = e ?? UnknownError(message: "Ocorreu um erro desonhecido");

  @override
  List<Object?> get props => [error];

  @override
  bool get stringify => false;
}
