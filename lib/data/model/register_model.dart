import 'dart:convert';
import '../../domain/entities/register_request.dart';
import '../../domain/entities/register_response.dart';

class RegisterRequestModel extends RegisterRequest {
   RegisterRequestModel({
    required super.password,
    required super.email,
    required super.isActive,
    required super.isSuperuser,
    required super.isVerified,
  });
  factory RegisterRequestModel.fromRawJson(String str) =>
      RegisterRequestModel.fromJson(json.decode(str));

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      password: json["password"],
      email: json["email"],
      isActive: json["isActive"],
      isSuperuser: json["isSuperuser"],
      isVerified: json["isVerified"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "email": email,
      "isActive": isActive,
      "isSuperuser": isSuperuser,
      "isVerified": isVerified,
    };
  }

}

class RegisterResponseModel extends RegisterResponse {
  const RegisterResponseModel({
    required super.id,
    required super.email,
    required super.isActive,
    required super.isSuperuser,
    required super.isVerified,
    required super.balance,
  });

  factory RegisterResponseModel.fromRawJson(String str) =>
      RegisterResponseModel.fromJson(json.decode(str));

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      id: json["id"],
      email: json["email"],
      isActive: json["isActive"],
      isSuperuser: json["isSuperuser"],
      isVerified: json["isVerified"],
      balance: json["balance"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "isActive": isActive,
      "isSuperuser": isSuperuser,
      "isVerified": isVerified,
      "balance": balance,
    };
  }
} 
