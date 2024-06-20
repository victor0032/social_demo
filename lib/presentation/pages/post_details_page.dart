import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/post.dart';
import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_event.dart';
import '../blocs/user/user_state.dart';
import '../widgets/comment_card.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_text_field.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;

  const PostDetailsPage({
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: BlocProvider(
                        create: (context) => GetIt.I<UserBloc>()
                          ..add(GetUserProfileEvent(post.userId)),
                        child: BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                            if (state is UserLoaded) {
                              return Row(
                                children: [
                                  CircleAvatar(
                                      radius: 30,
                                      backgroundImage: const AssetImage(
                                          'assets/images/loading.gif'),
                                      foregroundImage: NetworkImage(
                                          state.user.profilePicture)),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.user.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        DateFormat.yMMMEd()
                                            .format(post.dateTime),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(post.text),
                    ),
                    Hero(
                      tag: post.id,
                      child: FadeInImage(
                        placeholder:
                            const AssetImage('assets/images/loading.gif'),
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
                              icon: Icons.thumb_up_outlined,
                              count: post.reactions),
                          CustomIconButton(
                              icon: Icons.comment_outlined,
                              count: post.comments.length),
                          CustomIconButton(
                              icon: Icons.share_outlined, count: post.shared),
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: post.comments.length,
                      itemBuilder: (context, index) {
                        return CommentCard(comment: post.comments[index]);
                      },
                    )
                  ],
                ),
              ),
            ),
            const CustomTextField(hintText: 'Add a comment',),
          ],
        ),
      ),
    );
  }
}
