import 'package:flutter/material.dart';

import '../../components/users_list_view.dart';

class DatabaseUsersView extends StatelessWidget {
  const DatabaseUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
      body: UsersListView(users: []),
    );
  }
}
