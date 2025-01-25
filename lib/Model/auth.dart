class User {
  final String email;
  final String password;
  final String id;

  User({required this.email, required this.password, required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      id: json['id'],
    );
  }
}
