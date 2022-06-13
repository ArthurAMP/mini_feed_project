class AuthorModel {
  AuthorModel({
    required this.id,
    required this.username,
  });

  final int id;
  final String username;

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        id: json["id"],
        username: json["username"],
      );
}
