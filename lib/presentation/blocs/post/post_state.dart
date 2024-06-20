import 'package:equatable/equatable.dart';
import '../../../domain/entities/post.dart';

abstract class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class AllPostsLoaded extends PostState {
  final List<Post> allPosts;

  AllPostsLoaded(this.allPosts);

  @override
  List<Object?> get props => [allPosts];
}

class PostError extends PostState {
  final String message;

  PostError(this.message);

  @override
  List<Object?> get props => [message];
}
