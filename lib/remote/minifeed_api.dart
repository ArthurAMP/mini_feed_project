import 'package:http/http.dart' as http;
import 'package:mini_feed_project/models/posts.dart';

class MiniFeedAPI {
  static const _apiAuthority = "guide-flask.herokuapp.com";

  static Future<PostListPage?> getPostListPage(int page) async {
    final queryParameters = {
      "page": page.toString(),
    };
    final uri = Uri.https(_apiAuthority, "/posts", queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return PostListPage.fromRawJson(response.body);
    }
    return null;
  }
}
