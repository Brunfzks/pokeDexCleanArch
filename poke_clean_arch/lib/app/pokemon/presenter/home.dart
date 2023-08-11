import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_search_infinity/pokemon_search_infinity_cubit.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/pokemon_list_page.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/pokemon_quiz_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> telas = [
    PokemonSearchInfinity(),
    Container(),
    const PokemonQuiz(),
    Container(),
  ];

  int currentIndice = 0;

  @override
  void initState() {
    super.initState();
    context.read<PokemonSearchInfinityCubit>().searchPokemoninfinity(100, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[currentIndice],
      bottomNavigationBar: SizedBox(
        height: 83,
        child: BottomNavigationBar(
          onTap: (index) {
            onTabTapped(index);
          },
          unselectedLabelStyle: GoogleFonts.roboto(
            letterSpacing: 0.5,
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
          selectedItemColor: const Color(0xFF283141),
          unselectedItemColor: const Color(0xFF8D9DB9),
          selectedLabelStyle: GoogleFonts.roboto(
            letterSpacing: 0.5,
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: currentIndice,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color(0XFF283141),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.compare_arrows,
                  color: Color(0XFF8D9DB9),
                ),
                label: "Comparator"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.quiz,
                  color: Color(0XFF8D9DB9),
                ),
                label: "Quiz"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Color(0XFF8D9DB9),
                ),
                label: "Favorites"),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndice = index;
    });
  }
}
