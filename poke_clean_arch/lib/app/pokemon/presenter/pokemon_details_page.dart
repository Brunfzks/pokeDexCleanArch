// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_stat_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/species_model.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_details_cubit/pokemon_details_cubit_cubit.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_details_cubit/pokemon_details_cubit_state.dart';

import 'package:string_capitalize/string_capitalize.dart';

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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.pokemon.types[0].colorType,
        title:
            Text(PokemonModel.retornaIdTratado(widget.pokemon.id.toString())),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
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
          return Center(
            child: SizedBox(
              height: height * 0.4,
              width: width * 0.4,
              child: Lottie.asset('assets/loading.json'),
            ),
          );
        }
        return SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    state.pokemon.types[0].colorType,
                    Colors.white,
                  ],
                )),
              ),
              Column(
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
                  const SizedBox(
                    height: 10,
                  ),
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
                                height: 3,
                                topLeftRadius: 8,
                                topRightRadius: 8,
                                horizontalPadding: 28,
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
                                const Icon(Icons.dangerous),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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

class Stats extends StatelessWidget {
  Stats({
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
                        fontWeight: FontWeight.w400,
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
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(24.0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (pokemon.weight / 10) < 1
                  ? infoBio('${(pokemon.weight * 1000).toString()} g', 'Weight')
                  : infoBio('${(pokemon.weight / 10).toString()} Kg', 'Weight'),
              (pokemon.height / 10) < 1
                  ? infoBio('${(pokemon.height * 10).toString()} cm', 'Height')
                  : infoBio('${(pokemon.height / 10).toString()} m', 'Height'),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.15),
                    child: SizedBox(
                      width: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            width: pokemon.types.length == 1 ? 30 : null,
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
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 11),
                          child: Text(
                            pokemon.retornaAbilities(),
                            overflow: TextOverflow.visible,
                            maxLines: 1,
                            style: GoogleFonts.roboto(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget infoBio(String weight, height) {
  return Column(
    children: [
      Text(
        weight,
        style: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
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
