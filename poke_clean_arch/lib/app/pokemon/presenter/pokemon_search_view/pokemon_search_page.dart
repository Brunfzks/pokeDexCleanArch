import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/pokemon_search_view/pokemon_search_controller.dart';

class PokemonSearchPage extends GetView<PokemonSearchController> {
  const PokemonSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Card(
        elevation: 2,
        child: Column(children: [
          Text(
            controller.pokemonSelecionado.value.name,
          ),
          Image.network(controller.pokemonSelecionado.value.frontImg),
        ]),
      )),
    );
  }
}
