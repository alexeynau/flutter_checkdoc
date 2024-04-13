
import 'package:flutter_checkdoc/domain/entities/login_request.dart';
import 'package:flutter_checkdoc/domain/entities/login_response.dart';

class LoginRequestModel extends LoginRequest {
  LoginRequestModel({
    grantType,
    required username,
    required password,
    scope ,
    clientId,
    clientSecret,
  }) : super(
          grantType: grantType,
          username: username,
          password: password,
          scope: scope,
          clientId: clientId,
          clientSecret: clientSecret,
        );

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      grantType: json['grantType'],
      username: json['username'],
      password: json['password'],
      scope: json['scope'],
      clientId: json['clientId'],
      clientSecret: json['clientSecret'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "grantType": grantType,
      "username": username,
      "password": password,
      "scope": scope,
      "clientId": clientId,
      "clientSecret": clientSecret,
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