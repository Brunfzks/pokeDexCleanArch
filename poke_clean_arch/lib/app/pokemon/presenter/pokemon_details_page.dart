import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pokemon.types[0].colorType,
        title: Text(PokemonModel.retornaIdTratado(pokemon.id.toString())),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
            tooltip: 'Fav',
          )
        ],
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              stops: const [
                0.05,
                0.9,
              ],
              colors: [
                pokemon.types[0].colorType,
                Colors.white,
              ],
            )),
          ),
          Column(
            children: [
              Center(
                child: Image.network(
                  pokemon.frontImg,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Text(
                  StringUtils.capitalize(pokemon.name),
                  style: GoogleFonts.roboto(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
              ),
              Center(
                child: Text(
                  StringUtils.capitalize(
                      '${StringUtils.capitalize(pokemon.types[0].name)} Pokemon'),
                  style: GoogleFonts.roboto(
                    color: Colors.black38,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
