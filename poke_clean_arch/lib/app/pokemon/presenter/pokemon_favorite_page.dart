import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_favorite_cubit/pokemon_favorite_cubit.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_search_infinity/pokemon_search_infinity_cubit.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/widget/listitem_pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/widget/loading_screen.dart';

class PokemonFavoritePage extends StatefulWidget {
  PokemonFavoritePage({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  State<PokemonFavoritePage> createState() => _PokemonFavoritePageState();
}

class _PokemonFavoritePageState extends State<PokemonFavoritePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Favorites',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    color: const Color(0xFF283141),
                    wordSpacing: 0.5,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'This is the list of your favourite Pokémon!',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    color: const Color(0xFF4E5F7E),
                    wordSpacing: 0.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Favorite numbers: ${context.watch<PokemonFavoriteCubit>().state.pokemon.length}',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    color: const Color(0xFF4E5F7E),
                    wordSpacing: 0.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: BlocBuilder<PokemonFavoriteCubit, PokemonFavoriteState>(
                  builder: (context, state) {
                    if (context
                            .watch<PokemonSearchInfinityCubit>()
                            .state
                            .status ==
                        PokeStatus.error) {
                      return Center(
                          child: Text(
                              'Erro : ${context.watch<PokemonSearchInfinityCubit>().state.error}'));
                    }

                    if (state.pokemon.isEmpty ||
                        state.status == PokeFavoriteStatus.initial) {
                      return const Center(child: Text('Não a nenhum pokemon'));
                    }

                    if (state.status == PokeFavoriteStatus.loading) {
                      return const LoadingScreen();
                    }

                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                              ),
                              controller: widget.scrollController,
                              scrollDirection: Axis.vertical,
                              itemCount: state.pokemon.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListItemPokemon(
                                  index: index,
                                  pokemon: state.pokemon[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void modalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28.0),
        ),
      ),
      builder: (BuildContext bc) {
        return const Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 32,
                  height: 4,
                  child: Icon(
                    Icons.drag_handle,
                    color: Color(0xFF4E5F7E),
                  ),
                ),
              ),
            )
          ],
        );
      });
}
