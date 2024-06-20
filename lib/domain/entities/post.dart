import '../../data/models/comment_model.dart';

class Post {
  final String id;
  final String userId;
  final String text;
  final String pictureUrl;
  final DateTime dateTime;
  final int reactions;
  final List<CommentModel> comments;
  final int shared;

  Post(
      {required this.id,
      required this.userId,
      required this.text,
      required this.pictureUrl,
      required this.dateTime,
      required this.reactions,
      required this.comments,
      required this.shared});
}
