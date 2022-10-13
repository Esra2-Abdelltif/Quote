import 'package:flutter/material.dart';
import 'package:qoutes/core/utils/app_colors.dart';
import 'package:qoutes/feature/random_quote/presentaion/widgets/quotes_content.dart';

import '../../../../core/utils/app_strings.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar=AppBar(
      title: const Text(AppStrings.appTitle),
    );
    return  Scaffold(
      appBar: appBar,
      body: _buildScreenBody(),
    );
  }

  Widget _buildScreenBody(){
    return  Center(
      child: Column(children: [
        const QuoteConent(),
        InkWell(
           // onTap: () => _getRandomQuote(),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryColor),
              child: const Icon(
                Icons.refresh,
                size: 28,
                color: Colors.white,
              ),
            ))
      ],


      ),
    );
  }
}
