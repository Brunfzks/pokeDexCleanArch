import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name.dart';

class PokemonSearchController extends GetxController {
  var pokemonSelecionado = Pokemon(name: '', id: 0, frontImg: '').obs;
  TextEditingController pokeTextController = TextEditingController();

  final container = KiwiContainer();

  getPokemon() async {
    final usescase = container.resolve<PokemonSearchByName>();
    var pokemon = await usescase(ParamsSearchPokemon(nameText: 'jolteon'));
    pokemon.fold((l) => l.message, (r) => r);
  }

  @override
  void onInit() async {
    getPokemon();
  }
}
