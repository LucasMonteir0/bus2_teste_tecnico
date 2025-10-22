import 'package:bus2_teste_tecnico/data/repositories/random_user/random_user_repository.dart';
import 'package:bus2_teste_tecnico/ui/view_models/random_user/random_user_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomUserCubit extends Cubit<RandomUserState> {
  final RandomUserRepository _repository;

  RandomUserCubit(this._repository) : super(RandomUserInitialState());

  void fetchRandomUser() async {
    emit(FetchRandomUserLoadingState());
    final result = await _repository.fetchRandomUser();
    if (result.success) {
      emit(FetchRandomUserSuccessState(result.data!));
      return;
    } else {
      emit(FetchRandomUserErrorState(result.error));
    }
  }
}
