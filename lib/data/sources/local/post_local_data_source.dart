import 'package:social_demo/data/models/comment_model.dart';

import '../../models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getAllPosts();
}

// Simulated local data
List<PostModel> allPosts = [
  PostModel(
      id: 'post1',
      userId: '3',
      text:
          "Meet my adorable new friend! 🐾 Isn't he the cutest? #PuppyLove #NewFriend",
      pictureUrl: 'https://picsum.photos/id/237/640/360',
      dateTime: DateTime(2024, 6, 19, 17, 30),
      reactions: 51,
      comments: [
        CommentModel(
            id: '1',
            userId: '1',
            text:
                'What a precious little pup! 😍 Can I come over and pet him sometime?',
            dateTime: DateTime(2024, 6, 19, 18, 30)),
        CommentModel(
            id: '2',
            userId: '2',
            text: 'Oh my goodness, those eyes! 😭❤️',
            dateTime: DateTime(2024, 6, 19, 18, 45)),
        CommentModel(
            id: '5',
            userId: '2',
            text: 'Looks like the perfect cuddle buddy! 😊',
            dateTime: DateTime(2024, 6, 19, 18, 50)),
        CommentModel(
            id: '6',
            userId: '2',
            text: "I'm melting! Can't handle the cuteness overload! 🥰",
            dateTime: DateTime(2024, 6, 19, 19, 10)),
      ],
      shared: 20),
  PostModel(
      id: 'post2',
      userId: '2',
      text:
          'Freedom in monochrome. 🕊️ #BirdInFlight #CloudySky #BlackAndWhitePhotography',
      pictureUrl: 'https://picsum.photos/id/130/640/360',
      dateTime: DateTime(2024, 6, 18, 17, 30),
      reactions: 15,
      comments: [],
      shared: 10),
  PostModel(
      id: 'post3',
      userId: '1',
      text:
          'Working on my demo project to join Couch Surfing. Hoping for the best! 🤞💻 #CouchSurfing',
      pictureUrl: 'https://picsum.photos/id/1/640/360',
      dateTime: DateTime(2024, 6, 17, 17, 30),
      reactions: 103,
      comments: [
        CommentModel(
            id: '3',
            userId: '3',
            text:
                "You've got this! Your skills are perfect for the role. Rooting for you!",
            dateTime: DateTime(2024, 6, 17, 18, 30)),
        CommentModel(
            id: '4',
            userId: '4',
            text:
                "Looking forward to seeing your application! We're always on the lookout for talented individuals like you. Best of luck!",
            dateTime: DateTime(2024, 6, 17, 18, 45)),
      ],
      shared: 0),
];

class PostLocalDataSourceImpl implements PostLocalDataSource {
  @override
  Future<List<PostModel>> getAllPosts() async {
    return allPosts;
  }
}
