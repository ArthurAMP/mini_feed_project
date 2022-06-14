import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_feed_project/models/posts.dart';
import 'package:mini_feed_project/models/token.dart';

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

  static Future<Token?> login(String username, String password) async {
    final uri = Uri.https(_apiAuthority, "/auth/login");

    final requestHeaders = {
      "Content-Type": "application/json; charset=UTF-8",
    };
    final requestBody = {
      "username": username,
      "password": password,
    };
    final response = await http.post(uri,
        headers: requestHeaders, body: jsonEncode(requestBody));
    if (response.statusCode == 200) {
      return Token.fromRawJson(response.body);
    }
    return null;
  }
}
