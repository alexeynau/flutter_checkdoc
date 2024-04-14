import 'dart:convert';

import 'package:flutter_checkdoc/domain/entities/document.dart';
import 'package:meta/meta_meta.dart';

import '../../domain/entities/upload_file_response.dart';

class UserDocumentModel extends UserDocument {
  const UserDocumentModel({
    required name,
    required targetClass,
    required content,
  }) : super(
          name: name,
          targetClass: targetClass,
          content: content,
        );

  factory UserDocumentModel.fromRawJson(String str) =>
      UserDocumentModel.fromJson(json.decode(str));

  factory UserDocumentModel.fromJson(Map<String, dynamic> json) {
    return UserDocumentModel(
      name: json["name"],
      targetClass: json["target_class"],
      content: json["content"],
    );
  }
}

class UploadFileResponseModel extends UploadFileResponse {
  UploadFileResponseModel({
    required jobId,
    required jobTry,
    required docId,
    required enqueueTime,
  }) : super(
          jobId: jobId,
          jobTry: jobTry,
          docId: docId,
          enqueueTime: enqueueTime,
        );

  factory UploadFileResponseModel.fromRawJson(String str) =>
      UploadFileResponseModel.fromJson(json.decode(str));

  factory UploadFileResponseModel.fromJson(Map<String, dynamic> json) {
    return UploadFileResponseModel(
      jobId: json["job_id"],
      jobTry: json["job_try"],
      docId: json["doc_id"],
      enqueueTime: json["enqueue_time"],
    );
  }
}