import 'package:flutter/material.dart';
import 'package:qoutes/core/utils/app_colors.dart';
import 'package:qoutes/feature/random_quote/domain/entities/quotes.dart';

class QuoteConent extends StatelessWidget {
  final Quote quote;
  const QuoteConent({Key? key,required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.primaryColor, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text(quote.content,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text(quote.author,
                style: Theme.of(context).textTheme.bodyMedium),
          )
        ],
      ),
    );
  }
}
