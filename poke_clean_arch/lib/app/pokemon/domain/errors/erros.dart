class PokemonSearchException implements Exception {
  final String message;
  PokemonSearchException({
    required this.message,
  });

  @override
  String toString() => 'PokemonSearchException(message: $message)';
}
