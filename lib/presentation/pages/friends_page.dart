import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:social_demo/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:social_demo/presentation/widgets/friend_card.dart';

import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_event.dart';
import '../blocs/user/user_state.dart';
import '../widgets/custom_app_bar.dart';

class FriendsPage extends StatelessWidget {
  final String userId;

  const FriendsPage({required this.userId, super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<UserBloc>()..add(GetAllUsersEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          userId: userId,
          title: 'Friends',
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is AllUsersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AllUsersLoaded) {
              return ListView.builder(
                itemCount: state.allUsers.length,
                itemBuilder: (context, index) {
                  final user = state.allUsers[index];
                  return FriendCard(user: user);
                },
              );
            } else if (state is AllUsersError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No users available'));
            }
          },
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
      ),
    );
  }
}
