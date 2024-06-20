import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/post.dart';
import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_event.dart';
import '../blocs/user/user_state.dart';
import 'custom_icon_button.dart';
import 'custom_text_field.dart';

/// A reusable card widget that displays a post's details.
///
/// This widget shows the user's profile picture, the post text, and
/// the user ID. It is designed to be used in a list of posts.
class PostCard extends StatelessWidget {
  /// The post data to be displayed in the card.
  final Post post;

  /// Creates a PostCard widget.
  ///
  /// The [post] parameter is required and must not be null.
  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/feed/post', extra: post),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocProvider(
                create: (context) =>
                    GetIt.I<UserBloc>()..add(GetUserProfileEvent(post.userId)),
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoaded) {
                      return Row(
                        children: [
                          CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  const AssetImage('assets/images/loading.gif'),
                              foregroundImage:
                                  NetworkImage(state.user.profilePicture)),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat.yMMMEd().format(post.dateTime),
                              ),
                            ],
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
              const SizedBox(height: 8),
              Text(post.text),
            ],
          ),
        ),
        Hero(
          tag: post.id,
          child: FadeInImage(
            placeholder: const AssetImage('assets/images/loading.gif'),
            image: NetworkImage(post.pictureUrl),
            fadeInDuration: const Duration(milliseconds: 100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                  icon: Icons.thumb_up_outlined, count: post.reactions),
              CustomIconButton(
                  icon: Icons.comment_outlined, count: post.comments.length),
              CustomIconButton(icon: Icons.share_outlined, count: post.shared),
            ],
          ),
        ),
        const CustomTextField(hintText: 'Add a comment',),
      ]),
    );
  }
}
