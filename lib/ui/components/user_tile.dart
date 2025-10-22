import 'package:flutter/material.dart';

import '../../data/models/user/user_model.dart';
import 'app_network_image.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  final void Function(UserModel user)? onUserTap;

  const UserTile({super.key, required this.user, this.onUserTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onUserTap?.call(user);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Hero(
              tag: 'picture_${user.uuid}',
              child: AppNetworkImage.circle(
                imageUrl: user.picture.thumbnail,
                size: 50,
              ),
            ),
            title: Text(
              '${user.name.first} ${user.name.last}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
      ),
    );
  }
}
