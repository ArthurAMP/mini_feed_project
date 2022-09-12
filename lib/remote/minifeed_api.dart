import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_feed_project/models/posts.dart';
import 'package:mini_feed_project/models/user.dart';
import 'package:mini_feed_project/models/token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MiniFeedAPI {
  static const _apiAuthority = "guide-flask.herokuapp.com";
  static const storage = FlutterSecureStorage();

  static Future<PostListPage?> getPostListPage(int page) async {
    final queryParameters = {"page": page.toString(), "reversed": "true"};
    final uri = Uri.https(_apiAuthority, "/posts", queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return PostListPage.fromRawJson(response.body);
    }
    return null;
  }

  static Future<bool?> login(String username, String password) async {
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
      Token token = Token.fromRawJson(response.body);
      await storage.write(key: 'jwt', value: token.accessToken);
      return true;
    }
    return null;
  }

  static Future<bool?> signup(
      String username, String password, String email, String birthdate) async {
    final uri = Uri.https(_apiAuthority, "/users/");

    final requestHeaders = {
      "Content-Type": "application/json; charset=UTF-8",
    };
    final requestBody = {
      "birthdate": birthdate,
      "email": email,
      "username": username,
      "password": password,
    };
    final response = await http.post(uri,
        headers: requestHeaders, body: jsonEncode(requestBody));
    if (response.statusCode == 201) {
      return true;
    }

    return null;
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'jwt');
  }

  static Future<User?> getUser() async {
    final uri = Uri.https(_apiAuthority, "/users/me");

    final String token = await storage.read(key: 'jwt') ?? "";

    final String authorization = "Bearer " + token;

    final requestHeaders = {
      "Authorization": authorization,
    };

    final response = await http.get(uri, headers: requestHeaders);
    if (response.statusCode == 200) {
      User user = User.fromRawJson(response.body);
      return user;
    }
    return null;
  }
}
