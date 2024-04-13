

import 'package:dartz/dartz.dart';

import 'package:flutter_checkdoc/common/errors/failures.dart';

import 'package:flutter_checkdoc/domain/entities/document.dart';
import 'package:flutter_checkdoc/domain/entities/register_request.dart';
import 'package:flutter_checkdoc/domain/entities/register_response.dart';

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
  Future<Either<Failure, void>> uploadDocument(UserDocument document) {
    // try {
    //   remoteDataSource.uploadDocument(document);
      
    // } on Exception {
    //   return const Left(ServerFailure());
    // }
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> validateDocuments() {
    // TODO: implement validateDocuments
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, RegisterResponse>> register(RegisterRequest registerRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }
  // final UserLocalData localDataSource;
  // final InternetConnectionChecker connectionChecker;



}