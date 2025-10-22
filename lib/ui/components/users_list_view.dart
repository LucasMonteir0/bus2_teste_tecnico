import 'package:flutter/material.dart';

import '../../data/models/user/user_model.dart';
import 'user_tile.dart';

class UsersListView extends StatelessWidget {
  final List<UserModel> users;
  final void Function(UserModel user)? onUserTap;

  const UsersListView({super.key, this.onUserTap, required this.users});

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
          return UserTile(user: user, onUserTap: onUserTap);
        },
      ),
    );
  }
}
