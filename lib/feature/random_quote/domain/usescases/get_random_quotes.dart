import 'package:dartz/dartz.dart';
import 'package:qoutes/core/error/failure.dart';
import 'package:qoutes/feature/random_quote/domain/entities/quotes.dart';

import '../../../../core/useCases/base_useCase.dart';
import '../repository/base_random_quote_Repository.dart';

class GetRandomQuotesUseCases implements BaseUseCases<Quote,NoParameters>{
  final BaseRandomQuoteRepository baseRandomQuoteRepository ;
  GetRandomQuotesUseCases({required this.baseRandomQuoteRepository});

  @override
  Future<Either<Failure, Quote>> call(NoParameters Parameters)async {
   return await baseRandomQuoteRepository.getRandomQuote();
  }
}

// callable
// feature can call class like fun and take argrumnt and return result