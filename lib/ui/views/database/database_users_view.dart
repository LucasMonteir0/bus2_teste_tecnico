import 'package:bus2_teste_tecnico/core/helpers/snack_helper.dart';
import 'package:bus2_teste_tecnico/data/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../components/users_list_view.dart';
import '../../viewmodels/database_users/database_users.states.dart';
import '../../viewmodels/database_users/database_users_cubit.dart';

class DatabaseUsersView extends StatefulWidget {
  const DatabaseUsersView({super.key});

  @override
  State<DatabaseUsersView> createState() => _DatabaseUsersViewState();
}

class _DatabaseUsersViewState extends State<DatabaseUsersView> {
  late final DatabaseUsersCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = Modular.get<DatabaseUsersCubit>();
    _cubit.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;
    final surfaceColor = Theme.of(context).colorScheme.surface;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: surfaceColor,
        title: Text(
          "Banco de Usuários",
          style: textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade900,
          ),
        ),
        elevation: 0,
      ),
      body: BlocBuilder<DatabaseUsersCubit, DatabaseUsersState>(
        bloc: _cubit,
        builder: (context, state) {
          final List<UserModel> users = state is FetchDatabaseUsersSuccessState
              ? state.data
              : [];

          return UsersListView(
            users: users,
            hasHeroTag: false,
            isLoading: state is FetchDatabaseUsersLoadingState,
            isError: state is FetchDatabaseUsersErrorState,
          );
        },
      ),

      floatingActionButton:
          BlocConsumer<DatabaseUsersCubit, DatabaseUsersState>(
            bloc: _cubit,
            listener: (context, state) {
              if (state is ClearDatabaseUserErrorState) {
                SnackHelper.showError(
                  context: context,
                  message:
                      "Erro ao limpar banco de usuários. (${state.error.code})",
                );
              }
            },
            builder: (context, state) {
              return FloatingActionButton(
                backgroundColor: primaryColor,
                onPressed: () => _cubit.clear(),
                child: state is ClearDatabaseUserLoadingState
                    ? SizedBox.square(
                        dimension: 26,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.delete_rounded, color: Colors.white),
              );
            },
          ),
    );
  }
}
