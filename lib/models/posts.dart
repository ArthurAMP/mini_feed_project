import 'dart:convert';

class PostRequest {
  PostRequest({
    required this.page,
    required this.pages,
    required this.posts,
    required this.total,
  });

  final int page;
  final int pages;
  final List<Post> posts;
  final int total;

  factory PostRequest.fromRawJson(String str) =>
      PostRequest.fromJson(json.decode(str));

  factory PostRequest.fromJson(Map<String, dynamic> json) => PostRequest(
        page: json["page"],
        pages: json["pages"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        total: json["total"],
      );
}

class Post {
  Post({
    required this.authorId,
    required this.created,
    required this.id,
    required this.text,
  });

  final int authorId;
  final DateTime created;
  final int id;
  final String text;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        authorId: json["author_id"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        text: json["text"],
      );
}
