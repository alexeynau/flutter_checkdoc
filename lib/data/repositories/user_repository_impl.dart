import 'package:dartz/dartz.dart';

import 'package:flutter_checkdoc/common/errors/failures.dart';
import 'package:flutter_checkdoc/data/model/document_model.dart';
import 'package:flutter_checkdoc/data/model/register_model.dart';

import 'package:flutter_checkdoc/domain/entities/document.dart';
import 'package:flutter_checkdoc/domain/entities/login_request.dart';
import 'package:flutter_checkdoc/domain/entities/login_response.dart';
import 'package:flutter_checkdoc/domain/entities/register_request.dart';
import 'package:flutter_checkdoc/domain/entities/register_response.dart';

import '../../domain/entities/upload_file_response.dart';
import '../../domain/repository/user_repository.dart';
import '../datasources/user_remote.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteData remoteDataSource;
  UserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<UserDocument>>> fetchDocuments() {
    // TODO: implement fetchDocuments
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UploadFileResponse>> uploadDocument(UserDocument document) {
    UserDocumentModel userDocumentModel = UserDocumentModel(
     name: document.name,
     targetClass: document.targetClass,
     content: document.content,
      
    );
    try {
      return remoteDataSource
          .uploadDocument(userDocumentModel)
          .then((value) => Right(value));

    } on Exception {
      return Future.value(const Left(ServerFailure()));
    }
  }

  @override
  Future<Either<Failure, String>> validateDocuments() {
    // TODO: implement validateDocuments
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RegisterResponse>> register(
      RegisterRequest registerRequest) {
    try {
      final registerRequestModel = RegisterRequestModel(
        email: registerRequest.email,
        password: registerRequest.password,
        isActive: registerRequest.isActive,
        isSuperuser: registerRequest.isSuperuser,
        isVerified: registerRequest.isVerified,
      );
      return remoteDataSource
          .register(registerRequestModel)
          .then((value) => Right(value));
    } on Exception {
      return Future.value(const Left(ServerFailure()));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest loginRequest) {
    // TODO: implement login
    throw UnimplementedError();
  }
  // final UserLocalData localDataSource;
  // final InternetConnectionChecker connectionChecker;
}
