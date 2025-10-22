import 'package:bus2_teste_tecnico/ui/components/app_shimmer.dart';
import 'package:bus2_teste_tecnico/ui/components/list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes.dart';
import '../../data/models/user/user_model.dart';
import '../views/user_details/user_details_view.dart';
import 'user_tile.dart';

class UsersListView extends StatelessWidget {
  final List<UserModel> users;
  final bool isLoading;
  final bool isError;
  final bool hasHeroTag;

  const UsersListView({
    super.key,
    required this.users,
    this.hasHeroTag = true,
    this.isLoading = false,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListContainer(
      child: Builder(
        builder: (context) {
          if (isLoading) {
            return _Loading();
          }
          if (isError) {
            return Center(child: Text('Erro ao carregar usuários.'));
          }
          return ListView.separated(
            itemCount: users.isEmpty ? 1 : users.length,
            padding: EdgeInsets.zero,
            separatorBuilder: (_, _) => SizedBox(height: 4),
            itemBuilder: (context, index) {
              if (users.isEmpty) {
                return Center(child: Text('Nenhum usuário encontrado.'));
              }
              final user = users[index];
              return UserTile(
                user: user,
                hasHeroTag: hasHeroTag,
                onUserTap: (user) {
                  final params = UserDetailsViewParams(user: user);
                  Modular.to.pushNamed(Routes.userDetails, arguments: params);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        spacing: 16,
        children: List.generate(
          10,
          (index) => AppShimmer.rectangle(height: 80, width: double.infinity),
        ),
      ),
    );
  }
}
