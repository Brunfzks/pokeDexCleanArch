import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/pokemon_repository.dart';
import 'package:poke_clean_arch/app/pokemon/external/poke_api/pokemon_api_impl.dart';
import 'package:poke_clean_arch/app/pokemon/infra/datasource/pokemon_datasource.dart';
import 'package:poke_clean_arch/app/pokemon/infra/repositories/pokemon_repository_impl.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/pokemon_search_page.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name.dart';

final container = KiwiContainer()
  ..registerFactory(
      (container) => PokemonSearchByName(repository: container.resolve()))
  ..registerFactory<PokemonRepository>(
      (container) => PokemonRepositoryImpl(datasource: container.resolve()))
  ..registerFactory<PokemonDataSource>(
      (container) => PokemonApi(dio: container.resolve()))
  ..registerFactory<Dio>((container) => Dio());

void main() async {
  final usescase = container.resolve<PokemonSearchByName>();
  var pokemon = await usescase(ParamsSearchPokemon(nameText: 'jolteon'));
  print(pokemon.fold((l) => l.message, (r) => r.name));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonSearchPage(),
    );
  }
}
