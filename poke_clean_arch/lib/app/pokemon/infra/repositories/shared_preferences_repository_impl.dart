// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/shared_preferences_repository.dart';
import 'package:poke_clean_arch/app/pokemon/infra/datasource/shared_preferences_datasource.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/shared_preferences_get/shared_preferences_get.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/shared_preferences_save/shared_preferences_save.dart';

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferencesDataSource datasource;
  SharedPreferencesRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<SahredPreferencesExption, bool>> savePreferences(
      ParamnsSharedPreferencesSave params) async {
    try {
      final prefs = await datasource.savePreferences(params);
      return Right(prefs);
    } on SahredPreferencesExption catch (e) {
      return Left(e);
    } on Exception {
      return left(SahredPreferencesExption(message: 'Exception Error'));
    }
  }

  @override
  Future<Either<SahredPreferencesExption, String>> getPreferences(
      ParamnsSharedPreferencesGet params) async {
    try {
      final prefs = await datasource.getPreferences(params);
      return Right(prefs);
    } on SahredPreferencesExption catch (e) {
      return Left(e);
    } on Exception {
      return left(SahredPreferencesExption(message: 'Exception Error'));
    }
  }
}
