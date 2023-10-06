// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/shared_preferences_repository.dart';

import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';

abstract class ISharedPreferencesSave {
  Future<Either<SahredPreferencesExption, bool>> call(
      ParamnsSharedPreferencesSave params);
}

class SharedPreferencesSave implements ISharedPreferencesSave {
  SharedPreferencesRepository repository;
  SharedPreferencesSave({
    required this.repository,
  });

  @override
  Future<Either<SahredPreferencesExption, bool>> call(
      ParamnsSharedPreferencesSave params) async {
    if (params.key.isEmpty && params.value.isEmpty) {
      return left(SahredPreferencesExption(message: 'SEM PARAMETRO'));
    }
    return await repository.savePreferences(params);
  }
}

class ParamnsSharedPreferencesSave {
  String key;
  String value;
  ParamnsSharedPreferencesSave({
    required this.key,
    required this.value,
  });
}
