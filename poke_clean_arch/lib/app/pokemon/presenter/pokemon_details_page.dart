// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/evolution_chain.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_favorite_cubit/pokemon_favorite_cubit.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/widget/loading_screen.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_stat_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/species_model.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_details_cubit/pokemon_details_cubit_cubit.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_details_cubit/pokemon_details_cubit_state.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonModel pokemon;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    context.read<PokemonDetailsCubitCubit>().catchPokemonModel(widget.pokemon);
    context.read<PokemonDetailsCubitCubit>().searchSpecieId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.pokemon.types[0].colorType,
        title: Text(widget.pokemon.retornaIdTratado()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: context
                    .watch<PokemonFavoriteCubit>()
                    .state
                    .pokemon
                    .where((element) => element.id == widget.pokemon.id)
                    .isNotEmpty
                ? const Icon(
                    Icons.favorite,
                  )
                : const Icon(
                    Icons.favorite_border,
                  ),
            onPressed: () {
              context.read<PokemonFavoriteCubit>().favorite(widget.pokemon);
            },
            tooltip: 'Fav',
          )
        ],
      ),
      body: BlocBuilder<PokemonDetailsCubitCubit, PokemonDetailState>(
          builder: (context, state) {
        if (state.status == PokeDetailStatus.error) {
          return Center(child: Text('Erro : ${state.error}'));
        }

        if (state.status == PokeDetailStatus.loading) {
          return const LoadingScreen();
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        state.pokemon.types[0].colorType,
                        Colors.white,
                      ],
                          stops: const [
                        0.1,
                        0.9
                      ])),
                  child: Column(
                    children: [
                      Center(
                        child: Image.network(
                          state.pokemon.sprites.officialArtwork.frontDefault,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Text(
                          StringUtils.capitalize(state.pokemon.name),
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          StringUtils.capitalize(
                              '${StringUtils.capitalize(state.pokemon.types[0].name)} Pokemon'),
                          style: GoogleFonts.roboto(
                            color: Colors.black38,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: DefaultTabController(
                        length: 4,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: TabBar(
                                overlayColor: MaterialStateProperty.all(
                                  Colors.transparent,
                                ),
                                tabs: const [
                                  Tab(
                                    text: 'About',
                                  ),
                                  Tab(
                                    text: 'Stats',
                                  ),
                                  Tab(
                                    text: 'Moves',
                                  ),
                                  Tab(
                                    text: 'Evolutions',
                                  ),
                                ],
                                indicator: MaterialIndicator(
                                  height: 4,
                                  topLeftRadius: 8,
                                  topRightRadius: 8,
                                  horizontalPadding: 2,
                                  tabPosition: TabPosition.bottom,
                                ),
                                indicatorColor: Colors.black,
                                labelColor: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  About(
                                    specie: state.specie,
                                    pokemon: state.pokemon,
                                  ),
                                  Stats(stats: state.pokemon.stats),
                                  Moves(
                                    pokemon: state.pokemon,
                                  ),
                                  Evolution(
                                    evolutions: state.evolutions,
                                    evolutionChain: state.evolutionChain,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class Moves extends StatelessWidget {
  const Moves({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Divider(),
            ),
        itemCount: pokemon.moves.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              StringUtils.capitalize(
                pokemon.moves[index].name,
              ),
              style: GoogleFonts.roboto(
                color: Colors.black87,
                wordSpacing: 2,
                fontSize: 14,
              ),
            ),
          );
        });
  }
}

class Evolution extends StatelessWidget {
  final List<PokemonModel> evolutions;
  final EvolutionChain evolutionChain;
  const Evolution({
    Key? key,
    required this.evolutions,
    required this.evolutionChain,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: evolutions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              EvolutionCard(
                pokemon: evolutions[index],
              ),
              index != evolutions.length - 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: SizedBox(
                              height: 48,
                              child: VerticalDivider(
                                width: 1,
                              )),
                        ),
                        Container()
                      ],
                    )
                  : Container(),
            ],
          );
        });
  }
}

class EvolutionCard extends StatelessWidget {
  final PokemonModel pokemon;
  const EvolutionCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.read<PokemonDetailsCubitCubit>().state.pokemon.id !=
            pokemon.id) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => DetailsPage(
                        pokemon: pokemon,
                      ))));
        }
      },
      child: SizedBox(
        width: 280,
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(pokemon.sprites.frontDefault),
            ),
            const SizedBox(
              width: 24,
            ),
            SizedBox(
                width: 108,
                height: 125,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        pokemon.retornaIdTratado(),
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF8D9DB9),
                          wordSpacing: 2,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        pokemon.name.capitalize(),
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF283141),
                          wordSpacing: 2,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                          height: 83,
                          width: 62,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: pokemon.types.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: SizedBox(
                                    height: 36,
                                    width: 62,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: const Color(0xFFDFE4EC))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(
                                            pokemon.types[index].urlPicture,
                                            width: 15,
                                            height: 15,
                                            color:
                                                pokemon.types[index].colorType,
                                          ),
                                          Text(
                                            pokemon.types[index].name
                                                .capitalize(),
                                            style: GoogleFonts.roboto(
                                                color: Colors.black87,
                                                wordSpacing: 2,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Stats extends StatelessWidget {
  const Stats({
    Key? key,
    required this.stats,
  }) : super(key: key);

  final List<PokemonStatModel> stats;

  List<Widget> listReturn(PokemonStatModel stat) {
    final children = <Widget>[];

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
          itemCount: stats.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 64,
                    child: Text(
                      stats[index].stat.name.capitalize(),
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF4E5F7E),
                        wordSpacing: 0.5,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Text(
                      stats[index].baseStat.toString(),
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF283141),
                        wordSpacing: 0.5,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    height: 20,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, index1) {
                        return SizedBox(
                          height: 15,
                          width: 15,
                          child: SvgPicture.asset(
                            'assets/StatProg.svg',
                            color: stats[index].baseStat / 10 <= index1
                                ? const Color(0xFFDFE4EC)
                                : const Color(0xFFFFCC00),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class About extends StatelessWidget {
  const About({Key? key, required this.pokemon, required this.specie})
      : super(key: key);

  final PokemonModel pokemon;
  final SpeciesModel specie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            specie.flavorTextEntries[0].flavorText,
            textAlign: TextAlign.left,
            style: GoogleFonts.roboto(
              color: Colors.black87,
              wordSpacing: 2,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 100,
            width: 312,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            decoration: BoxDecoration(
                color: const Color(0xFFF2F4F7),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                (pokemon.weight / 10) < 1
                    ? infoBio('${(pokemon.weight * 1000).toString()} g',
                        'Weight', 'assets/weight.svg')
                    : infoBio('${(pokemon.weight / 10).toString()} Kg',
                        'Weight', 'assets/weight.svg'),
                const VerticalDivider(),
                (pokemon.height / 10) < 1
                    ? infoBio('${(pokemon.height * 10).toString()} cm',
                        'Height', 'assets/height.svg')
                    : infoBio('${(pokemon.height / 10).toString()} m', 'Height',
                        'assets/height.svg'),
              ],
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Container(
            height: 100,
            width: 312,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            decoration: BoxDecoration(
                color: const Color(0xFFF2F4F7),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        width: pokemon.types.length == 1 ? 30 : 50,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: pokemon.types.length,
                            ),
                            itemCount: pokemon.types.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 15,
                                height: 15,
                                child: SvgPicture.asset(
                                  pokemon.types[index].urlPicture,
                                  color: pokemon.types[index].colorType,
                                  fit: BoxFit.fill,
                                ),
                              );
                            }),
                      ),
                      Expanded(
                        child: Text(
                          'Category',
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          style: GoogleFonts.roboto(
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      children: [
                        Text(
                          pokemon.retornaAbilities(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          style: GoogleFonts.roboto(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Ability',
                            style: GoogleFonts.roboto(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget infoBio(String weight, height, icone) {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: SvgPicture.asset(icone),
          ),
          Text(
            weight,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        height,
        style: GoogleFonts.roboto(
          color: Colors.black87,
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
      ),
    ],
  );
}
