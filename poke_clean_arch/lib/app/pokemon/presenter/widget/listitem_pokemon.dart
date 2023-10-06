import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/pokemon_details_page.dart';

class ListItemPokemon extends StatelessWidget {
  const ListItemPokemon({
    Key? key,
    required this.pokemon,
    required this.index,
  }) : super(key: key);

  final PokemonModel pokemon;
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
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: pokemon.retornaGradiente(),
            border: Border.all(color: Colors.white70, width: 1)),
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
                          (pokemon.retornaIdTratado()),
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
                              physics: const NeverScrollableScrollPhysics(),
                              reverse: true,
                              itemCount: pokemon.types.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
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
                                              color: Colors.white,
                                              fontSize: 11),
                                        )),
                                  ],
                                );
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.network(
                            pokemon.sprites.frontDefault,
                            alignment: Alignment.centerRight,
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
      ),
    );
  }
}
