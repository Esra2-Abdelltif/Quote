
import '../models/quotes_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

// class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
//   ApiConsumer apiConsumer;
//
//   RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});
//
//   @override
//   Future<QuoteModel> getRandomQuote() async {
//     final response = await apiConsumer.get(
//       EndPoints.randomQuote,
//     );
//     return QuoteModel.fromJson(response);
//   }
// }