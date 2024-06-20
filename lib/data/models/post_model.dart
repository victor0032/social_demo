import '../../domain/entities/post.dart';

class PostModel extends Post {
  PostModel(
      {required super.id,
      required super.userId,
      required super.text,
      required super.pictureUrl,
      required super.dateTime,
      required super.reactions,
      required super.comments,
      required super.shared});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        userId: json['userId'],
        text: json['text'],
        pictureUrl: json['pictureUrl'],
        dateTime: json['dateTime'],
        reactions: json['reactions'],
        comments: json['comments'],
        shared: json['shared']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'text': text,
      'pictureUrl': pictureUrl,
      'dateTime': dateTime,
      'reactions': reactions,
      'comments': comments,
      'shared': shared
    };
  }
}
