import 'package:dio/dio.dart';
import 'package:flutter_checkdoc/common/errors/exceptions.dart';
import 'package:flutter_checkdoc/data/model/document_model.dart';
import 'package:flutter_checkdoc/service_locator.dart';
  import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class UserRemoteData {
  Future<List<UserDocumentModel>> fetchDocuments();
  Future<void> validateDocuments();
  Future<void> uploadDocument(UserDocumentModel document);
}

class UserRemoteDataImpl implements UserRemoteData {
  String? url = dotenv.env['URL'];

  @override
  Future<List<UserDocumentModel>> fetchDocuments() { 
    return Future.value([]);
  }
  
  @override
  Future<void> uploadDocument(UserDocumentModel document) async {
    var _dio = getIt<Dio>();

    // String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
        "target": document.name,
        "document":  MultipartFile.fromBytes(document.content, filename: document.name),
    });
    var response = await _dio.post("/v1/documents/", data: formData);
    print(response.statusCode);
    print(response.data);

    if (response.statusCode != 200) {
      throw ServerException('Failed to upload document');
    }
  }
  
  @override
  Future<void> validateDocuments() {
    // TODO: implement validateDocuments
    throw UnimplementedError();
  }
}