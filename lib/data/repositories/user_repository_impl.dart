

import 'package:dartz/dartz.dart';

import 'package:flutter_checkdoc/common/errors/failures.dart';

import 'package:flutter_checkdoc/domain/entities/document.dart';

import '../../domain/repository/user_repository.dart';
import '../datasources/user_remote.dart';

class UserRepositoryImpl implements UserRepository {
  // final UserRemoteData remoteDataSource;

  @override
  Future<Either<Failure, List<UserDocument>>> fetchDocuments() {
    // TODO: implement fetchDocuments
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> uploadDocument(UserDocument document) {
    // TODO: implement uploadDocument
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> validateDocuments() {
    // TODO: implement validateDocuments
    throw UnimplementedError();
  }
  // final UserLocalData localDataSource;
  // final InternetConnectionChecker connectionChecker;



}