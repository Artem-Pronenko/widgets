import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          foregroundImage: NetworkImage(user['image_url']),
          radius: 70,
        ),
        Text(
          user['username'],
          style: TextStyle(fontSize: 28),
        ),
        Text(
          user['comment'],
          style: TextStyle(fontSize: 19, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
