import 'dart:convert';

import 'package:flutter_checkdoc/domain/entities/document.dart';



class UserDocumentModel extends UserDocument {
  const UserDocumentModel({
    required name,
    required content,
  }) : super(
          name: name,
          content: content,
          
        );

  factory UserDocumentModel.fromRawJson(String str) =>
      UserDocumentModel.fromJson(json.decode(str));

  factory UserDocumentModel.fromJson(Map<String, dynamic> json) {
    return UserDocumentModel(
      name: json["name"],
      content: json["content"],
     
    );
  }
}