import 'package:flutter_checkdoc/domain/entities/login_request.dart';
import 'package:flutter_checkdoc/domain/entities/login_response.dart';

class LoginRequestModel extends LoginRequest {
  LoginRequestModel({
    grantType = "",
    required super.username,
    required super.password,
    scope = "",
    clientId = "",
    clientSecret = "",
  }) : super(
          grantType: grantType,
          scope: scope,
          clientId: clientId,
          clientSecret: clientSecret,
        );

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      grantType: json['grant_type'],
      username: json['username'],
      password: json['password'],
      scope: json['scope'],
      clientId: json['client_id'],
      clientSecret: json['client_secret'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "grant_type": grantType,
      "username": username,
      "password": password,
      "scope": scope,
      "client_id": clientId,
      "client_secret": clientSecret,
    };
  }
}

class LoginResponseModel extends LoginResponse {
  LoginResponseModel({
    required token,
    required refreshToken,
  }) : super(
          token: token,
          refreshToken: refreshToken,
        );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }
}
