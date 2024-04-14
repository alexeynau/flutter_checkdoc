import 'package:flutter_checkdoc/domain/use_cases/fetch_documents.dart';
import 'package:flutter_checkdoc/domain/use_cases/upload_file.dart';
import 'package:flutter_checkdoc/presentation/bloc/login_user_bloc/login_user_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_checkdoc/data/datasources/user_remote.dart';
import 'package:flutter_checkdoc/data/repositories/user_repository_impl.dart';
import 'package:flutter_checkdoc/domain/repository/user_repository.dart';
import 'package:flutter_checkdoc/domain/use_cases/login_user.dart';
import 'package:flutter_checkdoc/presentation/bloc/document_list_bloc/document_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'domain/use_cases/register_user.dart';
import 'presentation/bloc/register_bloc/register_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async {



  // getIt.registerFactory(() => NewsBloc(getNews: getIt(), getNewsTags: getIt()));
  getIt.registerFactory(() => DocumentListBloc(fetchDocuments: getIt()));
  getIt.registerFactory(() => RegisterBloc(registerUser: getIt()));
  getIt.registerFactory(() => LoginUserBloc(loginUser: getIt()));

  // Usecases

  // getIt.registerLazySingleton(() => LogOut(getIt()));
  getIt.registerLazySingleton(() => LoginUser(getIt()));
  getIt.registerLazySingleton(() => RegisterUser(getIt()));
  getIt.registerLazySingleton(() => FetchDocuments(getIt()));
  getIt.registerLazySingleton(() => UploadDocument(getIt()));


  // Repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );


  // getIt.registerLazySingleton<UserLocalData>(() => UserLocalDataImpl(
  //     sharedPreferences: getIt(),
  //     secureStorage: getIt(),
  //     oauthHelper: getIt<LksOauth2>().oauth2Helper));

  getIt.registerLazySingleton<UserRemoteData>(
      () => UserRemoteDataImpl());


  // Common / Core

  // External Dependency
  final dio = Dio(BaseOptions(receiveTimeout: const Duration(seconds: 30) , baseUrl: dotenv.env['URL']!));
  getIt.registerLazySingleton(() => dio);
  // final sharedPreferences = await SharedPreferences.getInstance();
  // getIt.registerLazySingleton(() => sharedPreferences);
  // const secureStorage = FlutterSecureStorage(
  //     aOptions: AndroidOptions(
  //   encryptedSharedPreferences: true,
  // ));
  // getIt.registerLazySingleton(() => secureStorage);
  // getIt.registerLazySingleton(() => InternetConnectionChecker.getInstance());
  // final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  // getIt.registerLazySingleton(() => packageInfo);
  // getIt.registerLazySingleton(() => LksOauth2());
  // final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // getIt.registerLazySingleton(() => deviceInfo);
}