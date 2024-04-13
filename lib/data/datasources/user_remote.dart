

import 'package:flutter_checkdoc/data/model/document_model.dart';
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
  Future<void> uploadDocument(UserDocumentModel document) {
    // TODO: implement uploadDocument
    throw UnimplementedError();
  }
  
  @override
  Future<void> validateDocuments() {
    // TODO: implement validateDocuments
    throw UnimplementedError();
  }
}