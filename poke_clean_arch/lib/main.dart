import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_details_cubit/pokemon_details_cubit_cubit.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_search_cubit/pokemon_search_cubit.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/cubits/pokemon_search_infinity/pokemon_search_infinity_cubit.dart';
import 'package:poke_clean_arch/app/pokemon/presenter/pokemon_list_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonSearchCubit>(
          create: (context) => PokemonSearchCubit(),
        ),
        BlocProvider<PokemonSearchInfinityCubit>(
          create: (context) => PokemonSearchInfinityCubit(),
        ),
        BlocProvider<PokemonDetailsCubitCubit>(
          create: (context) => PokemonDetailsCubitCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PokemonSearchInfinity(),
      ),
    );
  }
}
