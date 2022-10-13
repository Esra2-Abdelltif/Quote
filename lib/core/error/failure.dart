import 'package:equatable/equatable.dart';

 abstract class Failure extends Equatable{
  // final String Message;
  //
  // const Failure( this.Message);
  //
  // @override
  // // TODO: implement props
  // List<Object?> get props => [Message];
}

class ServerFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  // ServerFailure(String Message) : super(Message);
}

class CacheFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  // CacheFailure(String Message) : super(Message);
}