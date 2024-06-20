import 'package:dartz/dartz.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../core/error/failures.dart';
import '../sources/local/user_local_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> getUserProfile(String userId) async {
    try {
      final remoteUser = await remoteDataSource.getUserProfile(userId);
      return Right(remoteUser);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      final allUsers = await remoteDataSource.getAllUsers();
      return Right(allUsers);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
