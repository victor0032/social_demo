import 'package:dartz/dartz.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../../core/error/failures.dart';
import '../sources/local/post_local_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostLocalDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final allPosts = await remoteDataSource.getAllPosts();
      return Right(allPosts);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
