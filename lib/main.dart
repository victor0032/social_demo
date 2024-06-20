import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:social_demo/core/utils/routes/app_router.dart';
import 'package:social_demo/domain/usecases/get_all_users.dart';

import 'data/repositories/post_repository_impl.dart';
import 'data/repositories/user_repository_impl.dart';
import 'data/sources/local/post_local_data_source.dart';
import 'data/sources/local/user_local_data_source.dart';
import 'domain/repositories/post_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_all_posts.dart';
import 'domain/usecases/get_user_profile.dart';
import 'presentation/blocs/post/post_bloc.dart';
import 'presentation/blocs/user/user_bloc.dart';

final getIt = GetIt.instance;

void main() {
  setupLocator();
  runApp(const MyApp());
}

void setupLocator() {
  //Users
  getIt.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl());
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: getIt()));
  getIt.registerLazySingleton(() => GetUserProfile(getIt()));
  getIt.registerLazySingleton(() => GetAllUsers(getIt()));
  getIt.registerFactory(
      () => UserBloc(getUserProfile: getIt(), getAllUsers: getIt()));
  //Posts
  getIt.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl());
  getIt.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(remoteDataSource: getIt()));
  getIt.registerLazySingleton(() => GetAllPosts(getIt()));
  getIt.registerFactory(() => PostBloc(getAllPosts: getIt()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Social Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}
