class User {
  final String name;
  final String phoneNumber;
  final String email;
  final int id;

  const User(
      {required this.name,
      required this.phoneNumber,
      required this.email,
      required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'phoneNumber': String phoneNumber,
        'email': String email,
        'id': int id,
      } =>
        User(
          name: name,
          phoneNumber: phoneNumber,
          email: email,
          id: id,
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}
