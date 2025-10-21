import 'package:bus2_teste_tecnico/ui/viewmodels/random_user/random_user_cubit.dart';
import 'package:bus2_teste_tecnico/ui/viewmodels/random_user/random_user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final RandomUserCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = Modular.get<RandomUserCubit>();
    _cubit.fetchRandomUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RandomUserCubit, RandomUserState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is FetchRandomUserSuccessState) {
            return Center(child: Text(state.data.toJson().toString()));
          } else if (state is FetchRandomUserErrorState) {
            return Center(child: Text('Não foi possível carregar o usuário.'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
