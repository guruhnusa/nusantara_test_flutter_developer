import 'dart:convert';

class RegisterRequestModel {
  String name;
  String email;
  String password;
  String passwordConfirmation;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  factory RegisterRequestModel.fromJson(String str) =>
      RegisterRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromMap(Map<String, dynamic> json) =>
      RegisterRequestModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}
