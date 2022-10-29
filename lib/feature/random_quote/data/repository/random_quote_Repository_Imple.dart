import 'package:dartz/dartz.dart';
import 'package:qoutes/feature/random_quote/domain/entities/quotes.dart';
import 'package:qoutes/feature/random_quote/domain/repository/base_random_quote_Repository.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../datasource/random_quote_local_datasource.dart';
import '../datasource/random_quote_remote_datasource.dart';

 class RandomQuoteRepositoryImple implements BaseRandomQuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  RandomQuoteRepositoryImple({required this.networkInfo,required this.randomQuoteRemoteDataSource, required this.randomQuoteLocalDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote = await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    else {
      try {
        final casheRandomQuote = await randomQuoteLocalDataSource.getLastRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(casheRandomQuote);
        return Right(casheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

}

// if( is connected)
// {
//   get data from Api
// }
// else{
// get data from cache
// }
