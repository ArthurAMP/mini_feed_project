import 'dart:convert';

class Token {
  final String accessToken;

  const Token({required this.accessToken});

  factory Token.fromRawJson(String str) => Token.fromJson(json.decode(str));

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['access_token'],
    );
  }
}
