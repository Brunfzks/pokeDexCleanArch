import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_search_infinity/pokemon_search_infinity_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/pokemon_details_page.dart';

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
    context.read<PokemonSearchInfinityCubit>().searchPokemoninfinity(100, 0);
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        context.read<PokemonSearchInfinityCubit>().mockFecth();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          BlocBuilder<PokemonSearchInfinityCubit, PokemonSearchInfinityState>(
            builder: (context, state) {
              if (context.watch<PokemonSearchInfinityCubit>().state.status ==
                  PokeStatus.error) {
                return Center(
                    child: Text(
                        'Erro : ${context.watch<PokemonSearchInfinityCubit>().state.error}'));
              }

              if (state.pokemon.isEmpty || state.status == PokeStatus.initial) {
                return const Center(child: Text('Não a nenhum pokemon'));
              }

              if (state.status == PokeStatus.loading) {
                return Center(
                  child: SizedBox(
                    height: height * 0.4,
                    width: width * 0.4,
                    child: Lottie.asset('assets/loading.json'),
                  ),
                );
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
                            return ListItem(
                              index: index,
                              pokemon: state.pokemon[index],
                            );
                          },
                        ),
                      ),
                      state.status == PokeStatus.loadingMock
                          ? Center(
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.1,
                                child: Lottie.asset('assets/loading.json'),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.pokemon,
    required this.index,
  }) : super(key: key);

  final Pokemon pokemon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: pokemon.types[0].colorType,
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => DetailsPage(
                        pokemon: pokemon,
                      ))));
        },
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.bottomRight,
                  opacity: 0.4,
                  image: AssetImage('assets/pokebola-fundo-01.png'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringUtils.capitalize(pokemon.name),
                        style: GoogleFonts.roboto(color: Colors.white),
                      ),
                      Text(
                        PokemonModel.retornaIdTratado(pokemon.id.toString()),
                        style: GoogleFonts.roboto(color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            reverse: true,
                            itemCount: pokemon.types.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: SvgPicture.asset(
                                      pokemon.types[index].urlPicture,
                                      width: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        StringUtils.capitalize(
                                            pokemon.types[index].name),
                                        style: GoogleFonts.roboto(
                                            color: Colors.white, fontSize: 11),
                                      )),
                                ],
                              );
                            }),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.network(
                          pokemon.frontImg,
                          alignment: Alignment.centerRight,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
