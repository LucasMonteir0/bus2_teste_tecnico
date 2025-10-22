import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes.dart';
import '../../data/models/user/user_model.dart';
import '../views/user_details/user_details_view.dart';
import 'user_tile.dart';

class UsersListView extends StatelessWidget {
  final List<UserModel> users;

  const UsersListView({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(screenWidth * 0.08),
        ),
      ),
      child: ListView.separated(
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
            onUserTap: (user) {
              final params = UserDetailsViewParams(user: user);
              Modular.to.pushNamed(Routes.userDetails, arguments: params);
            },
          );
        },
      ),
    );
  }
}
