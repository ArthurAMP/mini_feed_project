import 'dart:convert';

class PostListPage {
  PostListPage({
    required this.page,
    required this.pages,
    required this.posts,
    required this.total,
  });

  final int page;
  final int pages;
  final List<PostModel> posts;
  final int total;

  factory PostListPage.fromRawJson(String str) =>
      PostListPage.fromJson(json.decode(str));

  factory PostListPage.fromJson(Map<String, dynamic> json) => PostListPage(
        page: json["page"],
        pages: json["pages"],
        posts: List<PostModel>.from(
            json["posts"].map((x) => PostModel.fromJson(x))),
        total: json["total"],
      );

  bool isLastPage() => (page == pages);
}

class PostModel {
  PostModel({
    required this.authorId,
    required this.created,
    required this.id,
    required this.text,
  });

  final int authorId;
  final DateTime created;
  final int id;
  final String text;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        authorId: json["author_id"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        text: json["text"],
      );
}
