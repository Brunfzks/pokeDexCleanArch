import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arch/app/pokemon/domain/entities/pokemon.dart';
import 'package:poke_clean_arch/app/pokemon/domain/errors/erros.dart';
import 'package:poke_clean_arch/app/pokemon/domain/repository/pokemon_repository.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/pokemon_search_by_name.dart';

class PokemonRepositoryMock implements PokemonRepository {
  @override
  Future<Either<PokemonSearchException, Pokemon>> pokemonSearch(
      ParamsSearchPokemon params) async {
    if (params.nameText == 'Dito') {
      return Left(PokemonSearchException(message: 'Repository Erro'));
    }
    return Right(Pokemon(
      name: 'Jolteon',
      id: 1,
      frontImg: 'C:/Pokemon/Jolteon',
    ));
  }
}

void main() {
  final repository = PokemonRepositoryMock();
  final useCases = PokemonSearch(repository: repository);
  test('Deve Retornar um pokemon', () async {
    final result = await useCases(ParamsSearchPokemon(nameText: 'Jolteon'));
    expect(result.isRight(), true);
  });

  test('Deve Retornar um erro quando o nameText for vazio', () async {
    final result = await useCases(ParamsSearchPokemon(nameText: ''));
    expect(result.isLeft(), true);
  });

  test('Deve Retornar um erro quando o repository falhar', () async {
    final result = await useCases(ParamsSearchPokemon(nameText: 'Dito'));
    expect(result.isLeft(), true);
  });
}
