import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qoutes/core/api/api_consumer.dart';
import 'package:qoutes/core/api/end_points.dart';
import 'package:qoutes/core/error/exceptions.dart';
import 'package:qoutes/core/utils/app_strings.dart';

import '../models/quotes_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

// frist way
// class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
//   http.Client client;
//
//   RandomQuoteRemoteDataSourceImpl({required this.client});
//
//   @override
//   Future<QuoteModel> getRandomQuote() async {
//     final RandomQuoteuRL = Uri.parse(EndPoints.randomQuote);
//     final response = await client.get(RandomQuoteuRL,
//         headers: {AppStrings.contentType: AppStrings.applicationJson});
//     if (response.statusCode == 200) {
//       return QuoteModel.fromJson(json.decode(response.body));
//     } else {
//       throw ServerException();
//     }
//   }
// }
//


// Second way

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {

  ApiConsumer apiConsumer;

  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(
      EndPoints.randomQuote,
    );
    return QuoteModel.fromJson(response);
  }
}
