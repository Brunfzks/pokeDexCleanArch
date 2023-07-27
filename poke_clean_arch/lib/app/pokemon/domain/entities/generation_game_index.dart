import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class GenerationGameIndex {
  final int gameIndex;
  final NamedApiResourceModel generation;
  GenerationGameIndex({
    required this.gameIndex,
    required this.generation,
  });
}
