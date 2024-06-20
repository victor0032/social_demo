import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:social_demo/presentation/widgets/custom_app_bar.dart';
import 'package:social_demo/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:social_demo/presentation/widgets/post_card.dart';
import '../blocs/post/post_bloc.dart';
import '../blocs/post/post_state.dart';
import '../blocs/post/post_event.dart';

class FeedPage extends StatelessWidget {
  final String userId;

  const FeedPage({required this.userId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<PostBloc>()..add(GetAllPostsEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          userId: userId,
          title: 'Feed',
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AllPostsLoaded) {
              return ListView.builder(
                itemCount: state.allPosts.length,
                itemBuilder: (context, index) {
                  final post = state.allPosts[index];
                  return PostCard(post: post);
                },
              );
            } else if (state is PostError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No posts available'));
            }
          },
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
      ),
    );
  }
}
