import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/comment.dart';
import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_event.dart';
import '../blocs/user/user_state.dart';

// A reusable widget that displays a comment with the user's profile picture,
/// name, the date and time of the comment, and the comment text.
///
/// This widget uses BlocProvider and BlocBuilder to manage the state of the user profile data.
class CommentCard extends StatelessWidget {
  /// The comment data to be displayed in the card.
  final Comment comment;

  /// Creates a CommentCard widget.
  ///
  /// The [comment] parameter is required and must not be null.
  const CommentCard({
    required this.comment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          BlocProvider(
            create: (context) =>
                GetIt.I<UserBloc>()..add(GetUserProfileEvent(comment.userId)),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoaded) {
                  return Row(
                    children: [
                      CircleAvatar(
                          backgroundImage:
                              const AssetImage('assets/images/loading.gif'),
                          foregroundImage:
                              NetworkImage(state.user.profilePicture)),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  state.user.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  DateFormat.yMd()
                                      .add_jm()
                                      .format(comment.dateTime),
                                ),
                              ],
                            ),
                            Text(comment.text)
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is UserLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return const Icon(Icons.account_circle);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
