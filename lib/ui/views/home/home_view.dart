import 'package:bus2_teste_tecnico/ui/viewmodels/random_user/random_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    return BlocListener<RandomUserCubit, RandomUserState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state is FetchRandomUserSuccessState) {
          _usersNotifier.value = [state.data, ..._usersNotifier.value];
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
      ),
    );
  }
}
