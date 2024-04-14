

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_checkdoc/common/errors/exceptions.dart';
import 'package:flutter_checkdoc/data/model/document_model.dart';
import 'package:flutter_checkdoc/data/model/login.dart';
import 'package:flutter_checkdoc/data/model/register_model.dart';
import 'package:flutter_checkdoc/data/model/validate_response_model.dart';
import 'package:flutter_checkdoc/service_locator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/upload_file_response_model.dart';

abstract class UserRemoteData {
  Future<List<UserDocumentModel>> fetchDocuments();
  Future<ValidateResponseModel> validateDocuments(String docId);
  Future<UploadFileResponseModel> uploadDocument(UserDocumentModel document);
  Future<RegisterResponseModel> register(RegisterRequestModel registerRequest);
  Future<LoginResponseModel> login(LoginRequestModel loginRequest);
}

class UserRemoteDataImpl implements UserRemoteData {
  String? url = dotenv.env['URL'];
  String? session = getIt<GlobalVariables>().globalVariable;

  @override
  Future<List<UserDocumentModel>> fetchDocuments() {
    UserDocumentModel document = UserDocumentModel(
      name: "Договор оферты",
      targetClass: "contract offer",
      content: Uint8List(0),
    );
    return Future.value([document]);
  }

  @override
  Future<UploadFileResponseModel> uploadDocument(
      UserDocumentModel document) async {
    var _dio = getIt<Dio>();

    // String fileName = file.path.split('/').last;

    List<int> documentBytes = document.content as List<int>;
    FormData formData = FormData.fromMap({
      "target": document.targetClass,
      "document":
          MultipartFile.fromBytes(documentBytes, filename: document.name),
    });
    var response = await _dio.post(
      "/v1/documents/",
      data: formData,
      options: Options(
        headers: {
          "Content-Type": "multipart/form-data",
          "Cookie": "docs-class=$session",
        },
      ),
    );
    if (response.statusCode == 201 || response.statusCode == 204) {
      return UploadFileResponseModel.fromJson(response.data);
    } else {
      throw ServerException(
          'Failed to upload document ${response.statusMessage}');
    }
  }

  @override
  Future<ValidateResponseModel> validateDocuments(String docId) {
    String endpoint = "/v1/status/$docId";

    var _dio = getIt<Dio>();

    return _dio
        .get(
      endpoint,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Cookie": "docs-class=$session",
        },
      ),
    )
        .then((response) {
      if (response.statusCode == 200) {
        return ValidateResponseModel.fromJson(response.data);
      } else {
        throw ServerException(
            'Failed to validate document ${response.statusMessage}');
      }
    });
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel registerRequest) {
    String endpoint = "/v1/register/";

    var _dio = getIt<Dio>();

    return _dio.post(endpoint, data: registerRequest.toJson()).then((response) {
      if (response.statusCode == 201) {
        return RegisterResponseModel.fromJson(response.data);
      } else {
        throw ServerException('Failed to register ${response.statusMessage}');
      }
    });
  }

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequest) {
    String endpoint = "/v1/login/";

    var _dio = getIt<Dio>();

    return _dio.post(endpoint, data: loginRequest.toJson()).then((response) {
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw ServerException('Failed to login ${response.statusMessage}');
      }
    });
  }
}
