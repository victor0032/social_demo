import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_event.dart';
import '../blocs/user/user_state.dart';

/// A reusable AppBar widget that displays the user's profile picture,
/// a title, and a settings icon button.
///
/// The profile picture is obtained from the UserBloc state.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The user ID used to fetch the profile picture.
  final String userId;

  /// The title that will be displayed.
  final String title;

  /// Creates a CustomAppBar widget.
  ///
  /// The [onSettingsPressed] parameter is required.
  const CustomAppBar({required this.userId, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BlocProvider(
        create: (context) =>
            GetIt.I<UserBloc>()..add(GetUserProfileEvent(userId)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                return InkWell(
                  onTap: () => context.go('/profile'),
                  child: CircleAvatar(
                      backgroundImage:
                          const AssetImage('assets/images/loading.gif'),
                      foregroundImage: NetworkImage(state.user.profilePicture)),
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
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
