import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/pokemon_model.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonModel pokemon;

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
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 4,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                          child: Material(
                            color: Colors.transparent,
                            child: TabBar(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              isScrollable: true,
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
                                horizontalPadding: 30,
                                tabPosition: TabPosition.bottom,
                              ),
                              indicatorColor: Colors.black,
                              labelColor: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(children: [
                            About(
                              pokemon: pokemon,
                            ),
                            Icon(Icons.dangerous),
                            Icon(Icons.dangerous),
                            Icon(Icons.dangerous),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({Key? key, required this.pokemon}) : super(key: key);

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan accumsan commodo. In hac habitasse platea dictumst. ',
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
              infoBio('${pokemon.weight.toString()} Kg', 'Weight'),
              infoBio('${pokemon.height.toString()} m', 'Height'),
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
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: pokemon.types.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 15,
                                    child: SvgPicture.asset(
                                      pokemon.types[index].urlPicture,
                                      width: 15,
                                      color: pokemon.types[index].colorType,
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                }),
                          ),
                          Expanded(
                            child: Text(
                              'Category',
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
