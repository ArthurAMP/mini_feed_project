import 'package:flutter/material.dart';
import 'package:mini_feed_project/models/posts.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Card(
          // padding: const EdgeInsets.all(12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        child: Text(
                          post.author.username.substring(0, 2).toUpperCase(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          post.author.username,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: MarkdownBody(
                      data: post.text,
                      styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                          textTheme: const TextTheme(
                              bodyText2: TextStyle(fontSize: 16.0)))),
                    ),
                  ),
                ],
              )),
        ));
  }
}
