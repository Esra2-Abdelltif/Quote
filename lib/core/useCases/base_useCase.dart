import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class BaseUseCases<T,Parameters>{
  Future<Either<Failure,T>>  call(Parameters Parameters);
}


//useses when fun not need paramters
 class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}