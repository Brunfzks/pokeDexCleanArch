import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name.dart';

class PokemonSearchPage extends StatefulWidget {
  PokemonSearchPage({Key? key}) : super(key: key);

  @override
  State<PokemonSearchPage> createState() => _PokemonSearchPageState();
}

class _PokemonSearchPageState extends State<PokemonSearchPage> {
  KiwiContainer container = KiwiContainer();
  Pokemon pokemon = Pokemon(name: '', id: 0, frontImg: '');

  getPokemon() async {
    final usescase = container.resolve<PokemonSearchByName>();
    var aux = await usescase(ParamsSearchPokemon(nameText: 'ditto'));
    aux.fold((l) => l.message, (r) => pokemon = r);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            children: [Text(pokemon.name), Image.network(pokemon.frontImg)]),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPokemon();
  }
}
