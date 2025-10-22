import 'package:bus2_teste_tecnico/core/helpers/snack_helper.dart';
import 'package:bus2_teste_tecnico/core/routes.dart';
import 'package:bus2_teste_tecnico/ui/viewmodels/random_user/random_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../data/models/user/user_model.dart';
import '../../components/ticker_component.dart';
import '../../components/users_list_view.dart';
import '../../viewmodels/random_user/random_user_states.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final RandomUserCubit _cubit;
  late final ValueNotifier<List<UserModel>> _usersNotifier;

  @override
  void initState() {
    super.initState();
    _cubit = Modular.get<RandomUserCubit>();
    _usersNotifier = ValueNotifier<List<UserModel>>([]);
  }

  void _onTick() {
    _cubit.fetchRandomUser();
  }

  @override
  void dispose() {
    _usersNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).colorScheme.primary;
    return BlocListener<RandomUserCubit, RandomUserState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state is FetchRandomUserSuccessState) {
          _usersNotifier.value = [state.data, ..._usersNotifier.value];
        }
        if (state is FetchRandomUserErrorState) {
          SnackHelper.showError(
            context: context,
            message: "Erro ao buscar usuário. (${state.error.code})",
          );
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Buscar usuário: ",
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ),
                    TickerComponent(onTick: _onTick),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _usersNotifier,
                builder: (context, users, _) {
                  return UsersListView(users: users);
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () => Modular.to.pushNamed(Routes.databaseUsers),
          child: const Icon(Symbols.database, color: Colors.white),
        ),
      ),
    );
  }
}
