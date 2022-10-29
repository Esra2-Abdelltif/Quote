
import 'package:dartz/dartz.dart';
import 'package:qoutes/feature/random_quote/domain/entities/quotes.dart';
import '../../../../core/error/failure.dart';

abstract class BaseRandomQuoteRepository{

  Future<Either<Failure,Quote>> getRandomQuote();


//package dartz
//Either conatin two type of class.
//Either<left,right>
       // left =>Failure
       // right=>vaild data

}