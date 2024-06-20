import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';
import '../../../domain/usecases/get_all_posts.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPosts getAllPosts;

  PostBloc({required this.getAllPosts}) : super(PostInitial()) {
    on<GetAllPostsEvent>((event, emit) async {
      emit(PostLoading());
      final failureOrPosts = await getAllPosts();
      failureOrPosts.fold(
        (failure) => emit(PostError('Failed to load posts')),
        (postsList) => emit(AllPostsLoaded(postsList)),
      );
    });
  }
}
