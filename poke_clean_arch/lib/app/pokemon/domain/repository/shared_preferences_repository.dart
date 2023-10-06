import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/shared_preferences_get/shared_preferences_get.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/shared_preferences_save/shared_preferences_save.dart';

abstract class SharedPreferencesRepository {
  Future<Either<SahredPreferencesExption, bool>> savePreferences(
      ParamnsSharedPreferencesSave params);
  Future<Either<SahredPreferencesExption, String>> getPreferences(
      ParamnsSharedPreferencesGet params);
}
