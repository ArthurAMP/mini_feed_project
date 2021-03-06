import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mini_feed_project/components/post_list_item.dart';
import 'package:mini_feed_project/models/posts.dart';
import 'package:mini_feed_project/remote/minifeed_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postPagedListView = PostPagedListView();

    Future refresh() async {
      postPagedListView = PostPagedListView();
    }

    return SafeArea(
      child: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Row(children: [
                      Text("MiniFeed",
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ]),
                  ),
                  postPagedListView,
                ],
              ))),
    );
  }
}

class PostPagedListView extends StatefulWidget {
  const PostPagedListView({Key? key}) : super(key: key);

  @override
  State<PostPagedListView> createState() => _PostPagedListViewState();
}

class _PostPagedListViewState extends State<PostPagedListView> {
  final PagingController<int, PostModel> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void _fetchPage(int pageKey) async {
    try {
      final page = await MiniFeedAPI.getPostListPage(pageKey);
      if (page == null) {
        throw Exception("An error occurred!");
      }
      if (page.isLastPage()) {
        _pagingController.appendLastPage(page.posts);
      } else {
        _pagingController.appendPage(page.posts, pageKey + 1);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    // return PagedListView.separated(
    return PagedListView(
      primary: false,
      shrinkWrap: true,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, post, index) =>
              PostListItem(post: post as PostModel)),
      // separatorBuilder: (context, index) => const Divider(
      //   height: 20,
      //   thickness: 0.5,
      //   indent: 20,
      //   endIndent: 20,
      //   color: Colors.grey,
      // ),
    );
  }
}
