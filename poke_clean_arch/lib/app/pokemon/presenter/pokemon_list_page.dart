import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_search_infinity/pokemon_search_infinity_cubit.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/widget/listitem_pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/widget/loading_screen.dart';

class PokemonSearchInfinity extends StatefulWidget {
  PokemonSearchInfinity({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  State<PokemonSearchInfinity> createState() => _PokemonSearchInfinityState();
}

class _PokemonSearchInfinityState extends State<PokemonSearchInfinity> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      if (mounted &&
          widget.scrollController.position.pixels ==
              widget.scrollController.position.maxScrollExtent &&
          context.read<PokemonSearchInfinityCubit>().state.status !=
              PokeStatus.loadingMock) {
        context.read<PokemonSearchInfinityCubit>().mockFecth();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Search(),
          ),
          Expanded(
            child: BlocBuilder<PokemonSearchInfinityCubit,
                PokemonSearchInfinityState>(
              builder: (context, state) {
                if (context.watch<PokemonSearchInfinityCubit>().state.status ==
                    PokeStatus.error) {
                  return Center(
                      child: Text(
                          'Erro : ${context.watch<PokemonSearchInfinityCubit>().state.error}'));
                }

                if (state.pokemon.isEmpty ||
                    state.status == PokeStatus.initial) {
                  return const Center(child: Text('Não a nenhum pokemon'));
                }

                if (state.status == PokeStatus.loading) {
                  return const LoadingScreen();
                }

                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                        state.status == PokeStatus.loadingMock
                            ? const SizedBox(height: 30, child: LoadingScreen())
                            : Container(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Pokédex',
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
            'Use the advanced search to find Pokémon by type, weakness, ability and more!',
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
        SizedBox(
          height: 48,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search a pokémon',
                    hintStyle: GoogleFonts.roboto(
                      color: const Color(0xFF8D9DB9),
                      wordSpacing: 0.5,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF283141),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFDFE4EC)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  modalBottomSheet(context);
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(
                      0xFFDFE4EC,
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.filter_alt_sharp),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
