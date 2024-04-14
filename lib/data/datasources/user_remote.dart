import 'package:dio/dio.dart';
import 'package:flutter_checkdoc/common/errors/exceptions.dart';
import 'package:flutter_checkdoc/data/model/document_model.dart';
import 'package:flutter_checkdoc/data/model/login.dart';
import 'package:flutter_checkdoc/data/model/register_model.dart';
import 'package:flutter_checkdoc/service_locator.dart';
  import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/entities/upload_file_response.dart';

abstract class UserRemoteData {
  Future<List<UserDocumentModel>> fetchDocuments();
  Future<void> validateDocuments();
  Future<UploadFileResponseModel> uploadDocument(UserDocumentModel document);
  Future<RegisterResponseModel> register(RegisterRequestModel registerRequest);
  Future<LoginResponseModel> login(LoginRequestModel loginRequest);
}

class UserRemoteDataImpl implements UserRemoteData {
  String? url = dotenv.env['URL'];

  @override
  Future<List<UserDocumentModel>> fetchDocuments() { 
    UserDocumentModel document = UserDocumentModel(
      name: "Договор оферты",
      targetClass: "contract offer",
      content: [],
    );
    return Future.value([document]);
  }
  
  @override
  Future<UploadFileResponseModel> uploadDocument(UserDocumentModel document) async {
    var _dio = getIt<Dio>();

    // String fileName = file.path.split('/').last;

    List<int> documentBytes = document.content as List<int>;
    FormData formData = FormData.fromMap({
        "target": document.targetClass,
        "document":  MultipartFile.fromBytes(documentBytes, filename: document.name),
    });
    var response = await _dio.post("/v1/documents/", data: formData);
    if (response.statusCode == 201) {
      return UploadFileResponseModel.fromJson(response.data);
    } else {
      throw ServerException('Failed to upload document ${response.statusMessage}');
    }
  }
  
  @override
  Future<void> validateDocuments() {
    // TODO: implement validateDocuments
    throw UnimplementedError();
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