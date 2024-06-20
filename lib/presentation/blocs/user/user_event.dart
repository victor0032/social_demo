import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserProfileEvent extends UserEvent {
  final String userId;

  GetUserProfileEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}

class GetAllUsersEvent extends UserEvent {
  GetAllUsersEvent();

  @override
  List<Object?> get props => [];
}