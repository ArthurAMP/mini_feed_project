import 'package:http/http.dart' as http;
import 'package:mini_feed_project/models/posts.dart';

const apiAuthority = "guide-flask.herokuapp.com";
const okStatusCode = 200;

Future<PostRequest?> getAllPostsAtPage(int page) async {
  final queryParameters = {
    "page": page,
  };
  final uri = Uri.https(apiAuthority, "/posts", queryParameters);
  final response = await http.get(uri);

  if (response.statusCode == okStatusCode) {
    return PostRequest.fromRawJson(response.body);
  }
  return null;
}
