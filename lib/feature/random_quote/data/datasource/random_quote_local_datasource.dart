import 'dart:convert';

import 'package:qoutes/core/error/exceptions.dart';
import 'package:qoutes/feature/random_quote/data/models/quotes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_strings.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString =
    sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      final cacheRandomQuote =
      Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(
        AppStrings.cachedRandomQuote, json.encode(quote));
  }
}