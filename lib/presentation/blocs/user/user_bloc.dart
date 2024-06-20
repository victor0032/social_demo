import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_all_users.dart';
import 'user_event.dart';
import 'user_state.dart';
import '../../../domain/usecases/get_user_profile.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserProfile getUserProfile;
  final GetAllUsers getAllUsers;

  UserBloc({required this.getUserProfile, required this.getAllUsers})
      : super(UserInitial()) {
    on<GetUserProfileEvent>((event, emit) async {
      emit(UserLoading());
      final failureOrUser = await getUserProfile(event.userId);
      failureOrUser.fold(
        (failure) => emit(UserError('Failed to load user profile')),
        (user) => emit(UserLoaded(user)),
      );
    });
    on<GetAllUsersEvent>((event, emit) async {
      emit(AllUsersLoading());
      final failureOrAllUsers = await getAllUsers();
      failureOrAllUsers.fold(
        (failure) => emit(AllUsersError('Failed to load all users')),
        (allUsers) => emit(AllUsersLoaded(allUsers)),
      );
    });
  }
}
