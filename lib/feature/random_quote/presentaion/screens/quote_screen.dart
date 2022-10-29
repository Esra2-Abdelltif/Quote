import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qoutes/config/locale/app_localizations.dart';
import 'package:qoutes/core/utils/app_colors.dart';
import 'package:qoutes/core/utils/app_strings.dart';
import 'package:qoutes/feature/random_quote/presentaion/cubit/randomquotes_cubit.dart';
import 'package:qoutes/feature/random_quote/presentaion/widgets/quotes_content.dart';
import 'package:qoutes/core/widgets/error_widget.dart' as error_widget;
import 'package:qoutes/feature/splash_screen/presentation/cubit/locale_cubit.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: ((context, state) {
          if (state is RandomQuoteIsLoading) {
            return Center(
              child: SpinKitFadingCircle(
                color: AppColors.primaryColor,
              ),
            );
          } else if (state is RandomQuoteError) {
            return error_widget.ErrorWidget(
              onPress: () => _getRandomQuote(),
            );
          } else if (state is RandomQuoteLoaded) {
            return Column(
              children: [
                QuoteConent(
                  quote: state.quote,
                ),
                InkWell(
                    onTap: () => _getRandomQuote(),
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
            );
          } else {
            return Center(
              child: SpinKitFadingCircle(
                color: AppColors.primaryColor,
              ),
            );
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.translate_outlined,
          color: AppColors.primaryColor,
        ),
        onPressed: () {
          if (AppLocalizations.of(context)!.isEnLocale) {
            BlocProvider.of<LocaleCubit>(context).toArabic();
          } else {
            BlocProvider.of<LocaleCubit>(context).toEnglish();
          }
        },
      ),
      title: Text(AppLocalizations.of(context)!.translate('app_name')!),
    );
    return RefreshIndicator(
        child: Scaffold(appBar: appBar, body: _buildBodyContent()),
        onRefresh: () => _getRandomQuote());
  }
}