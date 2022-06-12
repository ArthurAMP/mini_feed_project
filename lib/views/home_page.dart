import 'package:flutter/material.dart';
import 'package:mini_feed_project/models/posts.dart';
import 'package:mini_feed_project/remote/minifeed_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: PostPagedListView(),
    );
  }
}

class PostPagedListView extends StatefulWidget {
  const PostPagedListView({Key? key}) : super(key: key);

  @override
  State<PostPagedListView> createState() => _PostPagedListViewState();
}

class _PostPagedListViewState extends State<PostPagedListView> {
  final _controller = ScrollController();
  final _posts = <PostModel>[];
  var _hasNextPage = true;
  var _currentPage = 1;
  var _isLoading = false;

  @override
  void initState() {
    _controller.addListener(_scrollListener);
    super.initState();
    _fetchPosts();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_isLoading &&
        _hasNextPage) {
      _fetchPosts();
    }
  }

  void _fetchPosts() async {
    setState(() => _isLoading = true);
    var page = await MiniFeedAPI.getPostListPage(_currentPage);
    if (page != null) {
      if (page.posts.isNotEmpty) {
        setState(() => _posts.addAll(page.posts));
      }
      if (page.isLastPage()) {
        _hasNextPage = false;
      } else {
        _currentPage++;
      }
    }
    setState(() => _isLoading = false);
  }

  Widget _buildListView() {
    var itemCount = _posts.length;
    if (_hasNextPage) itemCount++;
    return ListView.separated(
        controller: _controller,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        itemBuilder: (context, index) {
          if (index < _posts.length) {
            return PostListItem(post: _posts[index]);
          }
          return const Center(child: CircularProgressIndicator());
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: itemCount);
  }

  @override
  Widget build(BuildContext context) {
    if (_posts.isNotEmpty) return _buildListView();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
