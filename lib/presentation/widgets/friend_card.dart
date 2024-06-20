import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

/// A reusable widget that displays a user's profile picture, name, and email.
///
/// This widget shows a user's profile picture in a circular avatar,
/// followed by the user's name and email arranged in a column.
class FriendCard extends StatelessWidget {
  /// The user data to be displayed in the card.
  final User user;

  /// Creates a FriendCard widget.
  ///
  /// The [user] parameter is required and must not be null.
  const FriendCard({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundImage: const AssetImage('assets/images/loading.gif'),
              foregroundImage: NetworkImage(user.profilePicture)),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  user.email,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
