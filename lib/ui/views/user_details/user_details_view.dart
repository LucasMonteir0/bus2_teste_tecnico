import 'package:bus2_teste_tecnico/data/models/user/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailsViewParams {
  final UserModel user;

  UserDetailsViewParams({required this.user});
}

class UserDetailsView extends StatelessWidget {
  final UserDetailsViewParams params;

  const UserDetailsView({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(child: Text('Details View')),
    );
  }
}
