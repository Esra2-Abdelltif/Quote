import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'randomquotes_state.dart';

class RandomquotesCubit extends Cubit<RandomquotesState> {
  RandomquotesCubit() : super(RandomquotesInitial());
}
