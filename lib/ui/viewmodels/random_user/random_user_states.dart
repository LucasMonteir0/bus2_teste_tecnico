import "package:equatable/equatable.dart";

import "../../../core/errors/http_errors.dart";
import "../../../data/models/base_error.dart";

sealed class RandomUserState extends Equatable {}

class FetchRandomUserLoadingState implements RandomUserState {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class FetchRandomUserSuccessState<T> implements RandomUserState {
  final T data;

  const FetchRandomUserSuccessState(this.data);

  @override
  List<Object?> get props => [data];

  @override
  bool get stringify => false;
}

class RandomUserInitialState<T> implements RandomUserState {
  final T? data;

  const RandomUserInitialState([this.data]);

  @override
  List<Object?> get props => [data];

  @override
  bool get stringify => false;
}

class FetchRandomUserErrorState<T> implements RandomUserState {
  final BaseError error;

  FetchRandomUserErrorState(BaseError? e)
    : error = e ?? UnknownError(message: "Ocorreu um erro desonhecido");

  @override
  List<Object?> get props => [error];

  @override
  bool get stringify => false;
}
