import 'dart:convert';
import 'package:mini_feed_project/models/author.dart';

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
    required this.author,
    required this.created,
    required this.id,
    required this.text,
  });

  final AuthorModel author;
  final DateTime created;
  final int id;
  final String text;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        author: AuthorModel.fromJson(json["author"]),
        created: DateTime.parse(json["created"]),
        id: json["id"],
        text: json["text"],
      );
}
