import 'package:bus2_teste_tecnico/core/extensions/date_extension.dart';
import 'package:bus2_teste_tecnico/data/models/user/user_model.dart';
import 'package:bus2_teste_tecnico/ui/components/app_network_image.dart';
import 'package:bus2_teste_tecnico/ui/components/list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../components/user_detail_field.dart';

class UserDetailsViewParams {
  final UserModel user;
  final String tag;

  UserDetailsViewParams({required this.user, required this.tag});
}

class UserDetailsView extends StatelessWidget {
  final UserDetailsViewParams params;

  const UserDetailsView({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final surfaceColor = Theme.of(context).colorScheme.surface;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: surfaceColor,
        title: Text(
          "Detalhes",
          style: textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade900,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: params.tag,
              child: AppNetworkImage.circle(
                imageUrl: params.user.picture.large,
                size: 120,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '${params.user.name.first} ${params.user.name.last}',
              style: textTheme.displaySmall?.copyWith(
                color: Colors.grey.shade700,
              ),
            ).animate().fadeIn(),
            SizedBox(height: 16),
            Expanded(
              child: ListContainer(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20,
                    children: [
                      UserDetailField(
                        label: 'Email',
                        value: params.user.email,
                        icon: Icons.email,
                      ),
                      UserDetailField(
                        label: 'Telefone',
                        value: params.user.phone,
                        icon: Icons.phone,
                      ),
                      UserDetailField(
                        label: 'Celular',
                        value: params.user.cell,
                        icon: Icons.smartphone,
                      ),
                      UserDetailField(
                        label: 'Data de Nascimento',
                        value: params.user.dob.date.toBrDate,
                        icon: Icons.cake,
                      ),
                      UserDetailField(
                        label: 'País',
                        value: params.user.location.country,
                      ),
                      UserDetailField(
                        label: 'Cidade',
                        value: params.user.location.city,
                      ),
                      UserDetailField(
                        label: 'Estado',
                        value: params.user.location.state,
                      ),
                      UserDetailField(
                        label: 'Endereço',
                        value:
                            '${params.user.location.street.number} ${params.user.location.street.name}',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
