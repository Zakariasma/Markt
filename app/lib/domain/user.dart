class User {
  final int id;
  final String username;
  final String password;
  final String picture;

  User({required this.id, required this.username, required this.password, this.picture = ''});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'picture': picture,
    };
  }
}
