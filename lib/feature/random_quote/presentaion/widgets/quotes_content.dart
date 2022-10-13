import 'package:flutter/material.dart';
import 'package:qoutes/core/utils/app_colors.dart';

class QuoteConent extends StatelessWidget {
  const QuoteConent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.primaryColor, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text("quote.content",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text("quote.author",
                style: Theme.of(context).textTheme.bodyMedium),
          )
        ],
      ),
    );
  }
}
