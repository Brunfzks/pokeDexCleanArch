import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class VerboseEffect {
  final String effect;
  final String shortEffect;
  final NamedApiResourceModel language;
  VerboseEffect({
    required this.effect,
    required this.shortEffect,
    required this.language,
  });
}
