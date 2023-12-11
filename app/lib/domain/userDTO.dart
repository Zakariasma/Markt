class UserDTO {

  final String username;
  final String password;
  final String picture;

  UserDTO({required this.username, required this.password, this.picture = ''});

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      username: json['username'],
      password: json['password'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'picture': picture,
    };
  }
}
