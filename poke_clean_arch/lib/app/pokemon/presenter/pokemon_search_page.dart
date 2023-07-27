import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_search_cubit/pokemon_search_cubit.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_search_infinity/pokemon_search_infinity_cubit.dart';

// ignore: must_be_immutable
class PokemonSearchPage extends StatelessWidget {
  PokemonSearchPage({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          BlocBuilder<PokemonSearchInfinityCubit, PokemonSearchInfinityState>(
            builder: (context, state) {
              if (context.watch<PokemonSearchInfinityCubit>().state.error !=
                  '') {
                return Center(
                    child: Text(
                        'Erro : ${context.watch<PokemonSearchInfinityCubit>().state.error}'));
              }

              if (state.pokemon.isEmpty) {
                return const Center(
                    child: Text('Por favor Pesquise um pokemon'));
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.watch<PokemonSearchCubit>().state.pokemon.name,
                  ),
                  Image.network(
                    context
                        .watch<PokemonSearchCubit>()
                        .state
                        .pokemon
                        .sprites
                        .frontDefault,
                  )
                ],
              );
            },
          ),
        ]),
      ),
    );
  }
}
