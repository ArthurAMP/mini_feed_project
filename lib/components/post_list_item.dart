import 'package:flutter/material.dart';
import 'package:mini_feed_project/models/posts.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Text("A${post.authorId}"),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        "Author ${post.authorId}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    post.text,
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
