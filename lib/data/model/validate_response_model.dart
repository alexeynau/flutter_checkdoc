import 'package:flutter_checkdoc/domain/entities/validate_response.dart';

class ValidateResponseModel extends ValidateResponse {
  ValidateResponseModel({
    required id,
    required verified,
    required createdAt,
    required name,
    required isDeleted,
    required cancellationReason,
  }) : super(
          id: id,
          verified: verified,
          createdAt: createdAt,
          name: name,
          isDeleted: isDeleted,
          cancellationReason: cancellationReason,
        );

  factory ValidateResponseModel.fromJson(Map<String, dynamic> json) {
    return ValidateResponseModel(
      id: json["id"],
      verified: json["verified"] == null ? null : json["verified"],
      createdAt: DateTime.parse(json["created_at"]),
      name: json["name"],
      isDeleted: json["is_deleted"],
      cancellationReason: json["cancellation_reason"],
    );
  }
}