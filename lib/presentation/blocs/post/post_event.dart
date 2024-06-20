import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllPostsEvent extends PostEvent {
  GetAllPostsEvent();

  @override
  List<Object?> get props => [];
}
