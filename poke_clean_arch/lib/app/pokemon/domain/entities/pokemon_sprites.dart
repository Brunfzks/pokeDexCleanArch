class PokemonSprites {
  final String backDefault;
  final String backShiny;
  final String frontDefault;
  final String frontShiny;
  final OfficialArtwork officialArtwork;
  PokemonSprites({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    required this.officialArtwork,
  });
}

class OfficialArtwork {
  final String frontDefault;
  final String frontShiny;

  OfficialArtwork(this.frontDefault, this.frontShiny);
}
