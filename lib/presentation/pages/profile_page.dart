import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_event.dart';
import '../blocs/user/user_state.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/read_only_text_field.dart';

class ProfilePage extends StatelessWidget {
  final String userId;

  const ProfilePage({
    required this.userId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocProvider(
        create: (context) =>
            GetIt.I<UserBloc>()..add(GetUserProfileEvent(userId)),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          const AssetImage('assets/images/loading.gif'),
                      foregroundImage: NetworkImage(state.user.profilePicture)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Edit Profile Photo')),
                  const SizedBox(
                    height: 10,
                  ),
                  ReadOnlyTextField(
                    initialValue: state.user.name,
                    labelText: 'Full Name',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ReadOnlyTextField(
                    initialValue: state.user.email,
                    labelText: 'Email',
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
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
    );
  }
}
