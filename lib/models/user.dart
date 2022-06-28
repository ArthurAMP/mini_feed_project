import 'dart:convert';

class User {
  final String birthdate;
  final String createdAt;
  final int id;
  final String username;

  const User({
    required this.birthdate,
    required this.createdAt,
    required this.id,
    required this.username,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      birthdate: json['birthdate'],
      createdAt: json['created_at'],
      id: json['id'],
      username: json['username'],
    );
  }
}
