import 'package:qoutes/core/error/failure.dart';
import 'package:qoutes/core/useCases/base_useCase.dart';
import 'package:dartz/dartz.dart';
import 'package:qoutes/feature/splash_screen/domain/repositories/lang_repository.dart';

class GetSavedLangUseCase implements BaseUseCases<String, NoParameters> {
  final BaseLangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String>> call(NoParameters params) async =>
      await langRepository.getSavedLang();
}