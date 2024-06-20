import 'package:equatable/equatable.dart';
import '../../../domain/entities/user.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class AllUsersLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  List<Object?> get props => [message];
}

class AllUsersLoaded extends UserState {
  final List<User> allUsers;

  AllUsersLoaded(this.allUsers);

  @override
  List<Object?> get props => [allUsers];
}

class AllUsersError extends UserState {
  final String message;

  AllUsersError(this.message);

  @override
  List<Object?> get props => [message];
}