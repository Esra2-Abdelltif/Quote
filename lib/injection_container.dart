//لو احنا عندنا two classes بنقول عليهم إنهم coupled لو فيه واحد فيهم بيعتمد على التاني ، Class A بيعتمد على Class B
// وبالتالي متقدرش تعمل compile ل class A بدون وجود Class B ، وحاجة زي كدا بتكون خطيرة جداً
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qoutes/core/api/api_consumer.dart';
import 'package:qoutes/core/api/app_interceptors.dart';
import 'package:qoutes/core/api/dio_consumer.dart';
import 'package:qoutes/core/network/network_info.dart';
import 'package:qoutes/feature/random_quote/data/datasource/random_quote_remote_datasource.dart';
import 'package:qoutes/feature/random_quote/data/repository/random_quote_Repository_Imple.dart';
import 'package:qoutes/feature/random_quote/domain/repository/base_random_quote_Repository.dart';
import 'package:qoutes/feature/random_quote/domain/usescases/get_random_quotes_usecases.dart';
import 'package:qoutes/feature/random_quote/presentaion/cubit/randomquotes_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/random_quote/data/datasource/random_quote_local_datasource.dart';
import 'package:http/http.dart' as http;

GetIt getIt = GetIt.instance;
class ServicesLocater {
  Future<void> init() async {
    ///! Features

    // Blocs
    getIt.registerFactory<RandomQuoteCubit>(() => RandomQuoteCubit(getRandomQuotesUseCases:  getIt()));

    // Use cases
    getIt.registerLazySingleton<GetRandomQuotesUseCases>(() => GetRandomQuotesUseCases(baseRandomQuoteRepository: getIt()));
    // Repository
    getIt.registerLazySingleton<BaseRandomQuoteRepository>(() => RandomQuoteRepositoryImple(
        networkInfo: getIt(),
        randomQuoteRemoteDataSource: getIt(),
        randomQuoteLocalDataSource: getIt()));
    // Data Sources
    getIt.registerLazySingleton<RandomQuoteLocalDataSource>(() => RandomQuoteLocalDataSourceImpl(sharedPreferences: getIt()));
    getIt.registerLazySingleton<RandomQuoteRemoteDataSource>(() => RandomQuoteRemoteDataSourceImpl(apiConsumer: getIt()));

    ///!core
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: getIt()));
    getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: getIt()));


    ///! External
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreferences);
    getIt.registerLazySingleton(() => Dio());
   // getIt.registerLazySingleton(() => http.Client());
    getIt.registerLazySingleton(() => InternetConnectionChecker());
    getIt.registerLazySingleton(() => AppIntercepters());
    getIt.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true));


  }
}