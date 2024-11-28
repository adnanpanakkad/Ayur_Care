class UserModel {
  final String? email;
  final String? password;

  UserModel({
    required this.email,
    required this.password,
  });

  // Convert JSON to User object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
    );
  }

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'pasword': password,
    };
  }
}
