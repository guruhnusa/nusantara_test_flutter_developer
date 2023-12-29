import 'dart:convert';

class AuthResponseModel {
    String message;
    String token;

    AuthResponseModel({
        required this.message,
        required this.token,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "token": token,
    };
}
