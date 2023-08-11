// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/quiz_cubit/quiz_cubit.dart';
import 'package:string_capitalize/string_capitalize.dart';

class PokemonQuiz extends StatefulWidget {
  const PokemonQuiz({Key? key}) : super(key: key);

  @override
  State<PokemonQuiz> createState() => _PokemonQuizState();
}

class _PokemonQuizState extends State<PokemonQuiz> {
  @override
  void initState() {
    super.initState();
    context.read<PokemonQuizCubit>().startGame();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'Who\'s that Pokémon',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: const Color(0xFF283141),
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: BlocBuilder<PokemonQuizCubit, PokemonQuizState>(
          builder: (context, state) {
        if (state.status == QuizStatus.error) {
          return Center(child: Text('Erro : ${state.error}'));
        }

        if (state.status == QuizStatus.loading) {
          return Center(
            child: SizedBox(
              height: height * 0.4,
              width: width * 0.4,
              child: Lottie.asset('assets/loading.json'),
            ),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: AnimatedOpacity(
                      opacity: state.status == QuizStatus.hit ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/hit_background.png"),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.network(
                      state
                          .pokemonSelected.sprites.officialArtwork.frontDefault,
                      height: 200,
                      fit: BoxFit.cover,
                      color:
                          state.status == QuizStatus.hit ? null : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView.builder(
                  itemCount: state.pokemons.length,
                  itemBuilder: (context, index) {
                    return CardSelect(pokemon: state.pokemons[index]);
                  },
                ),
              ),
            ),
            SizedBox(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () {
                  context.read<PokemonQuizCubit>().startGame();
                },
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFDFE4EC),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Again',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF283141),
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )),
            SizedBox(
              height: 16,
            ),
          ],
        );
      }),
    );
  }
}

class CardSelect extends StatelessWidget {
  final PokemonModel pokemon;

  const CardSelect({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonQuizCubit, PokemonQuizState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: GestureDetector(
            onTap: () {
              context.read<PokemonQuizCubit>().play(pokemon);
            },
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: context.watch<PokemonQuizCubit>().returnColor(pokemon),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFDFE4EC),
                ),
              ),
              child: Center(
                child: Text(
                  pokemon.name.capitalize(),
                  style: GoogleFonts.roboto(
                    color: const Color(0xFF283141),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
