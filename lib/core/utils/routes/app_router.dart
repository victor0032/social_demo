import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/post.dart';
import '../../../presentation/pages/feed_page.dart';
import '../../../presentation/pages/friends_page.dart';
import '../../../presentation/pages/post_details_page.dart';
import '../../../presentation/pages/profile_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/feed',
  routes: [
    GoRoute(
      path: '/friends',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const FriendsPage(userId: '1'),
          transitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/feed',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const FeedPage(userId: '1'),
          transitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      routes: [
        GoRoute(
          path: 'post',
          builder: (context, state) {
            Post postModel = state.extra as Post;
            return PostDetailsPage(post: postModel);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const ProfilePage(userId: '1'),
          transitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
