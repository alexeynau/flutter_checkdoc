

import 'package:dartz/dartz.dart';

import '../../common/errors/failures.dart';
import '../entities/document.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserDocument>>> fetchDocuments();
  Future<Either<Failure, String>> validateDocuments();
  Future<Either<Failure, void>> uploadDocument(UserDocument document);
}