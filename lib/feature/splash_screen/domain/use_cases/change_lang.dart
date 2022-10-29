import 'package:qoutes/core/error/failure.dart';
import 'package:qoutes/core/useCases/base_useCase.dart';
import 'package:dartz/dartz.dart';
import 'package:qoutes/feature/splash_screen/domain/repositories/lang_repository.dart';

class ChangeLangUseCase implements BaseUseCases<bool, String> {
  final BaseLangRepository langRepository;

  ChangeLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, bool>> call(String langCode) async =>
      await langRepository.changeLang(langCode: langCode);
}

