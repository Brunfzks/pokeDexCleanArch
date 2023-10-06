// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/shared_preferences_repository.dart';

abstract class ISharedPreferencesGet {
  Future<Either<SahredPreferencesExption, String>> call(
      ParamnsSharedPreferencesGet params);
}

class SharedPreferencesGet implements ISharedPreferencesGet {
  SharedPreferencesRepository repository;
  SharedPreferencesGet({
    required this.repository,
  });

  @override
  Future<Either<SahredPreferencesExption, String>> call(
      ParamnsSharedPreferencesGet params) async {
    return await repository.getPreferences(params);
  }
}

class ParamnsSharedPreferencesGet {
  String key;
  ParamnsSharedPreferencesGet({
    required this.key,
  });
}
