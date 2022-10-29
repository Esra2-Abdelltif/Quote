import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qoutes/core/error/failure.dart';
import 'package:qoutes/core/useCases/base_useCase.dart';
import 'package:qoutes/core/utils/app_strings.dart';
import 'package:qoutes/feature/random_quote/domain/entities/quotes.dart';
import 'package:qoutes/feature/random_quote/domain/usescases/get_random_quotes_usecases.dart';

part 'randomquotes_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuotesUseCases getRandomQuotesUseCases;

  RandomQuoteCubit({required this.getRandomQuotesUseCases}) : super(RandomquotesInitial());

  //ba5od object mn Cubit
  static RandomQuoteCubit get(context) => BlocProvider.of(context);

  Future<void> getRandomQuote() async{
   emit(RandomQuoteIsLoading());
   //ba5doh mn GetRandomQuotesUseCases
   Either<Failure, Quote> response = await getRandomQuotesUseCases( NoParameters());
   emit(response.fold(
           (failure) => RandomQuoteError(msg: _mapFailureToMsg(failure)),
           (quote) => RandomQuoteLoaded(quote: quote)));


  }
  String _mapFailureToMsg(Failure failure) {
   switch (failure.runtimeType) {
    case ServerFailure:
     return AppStrings.serverFailure;
    case CacheFailure:
     return AppStrings.cacheFailure;
    default:
     return AppStrings.unexpectedError;
   }
  }
}
