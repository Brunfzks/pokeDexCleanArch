// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonSearchException implements Exception {
  final String message;
  PokemonSearchException({
    required this.message,
  });

  @override
  String toString() => 'PokemonSearchException(message: $message)';
}

class SpeciesSearchException implements Exception {
  final String message;
  SpeciesSearchException({
    required this.message,
  });

  @override
  String toString() => 'PokemonSearchException(message: $message)';
}

class EvolutionChainSearchException implements Exception {
  final String message;
  EvolutionChainSearchException({
    required this.message,
  });

  @override
  String toString() => 'EvolutionChainSearch(message: $message)';
}
