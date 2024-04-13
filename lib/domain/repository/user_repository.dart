

import 'package:dartz/dartz.dart';
import 'package:flutter_checkdoc/domain/entities/register_request.dart';
import 'package:flutter_checkdoc/domain/entities/register_response.dart';

import '../../common/errors/failures.dart';
import '../entities/document.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserDocument>>> fetchDocuments();
  Future<Either<Failure, String>> validateDocuments();
  Future<Either<Failure, void>> uploadDocument(UserDocument document);
  Future<Either<Failure, RegisterResponse>> register(RegisterRequest registerRequest);
}