part of 'randomquotes_cubit.dart';

@immutable
abstract class RandomQuoteState extends Equatable{

  const RandomQuoteState();
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class RandomquotesInitial extends RandomQuoteState {

}
class RandomQuoteIsLoading extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState {
  //if is loading hgeb data ele ana me7tgha
  final Quote quote;
  const RandomQuoteLoaded({required this.quote});
  @override
  List<Object> get props => [quote];
}

class RandomQuoteError extends RandomQuoteState {
  final String msg;

  const RandomQuoteError({required this.msg});

  @override
  List<Object> get props => [msg];
}
