import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class PalParkEncounterArea {
  final int baseScore;
  final int rate;
  final NamedApiResourceModel area;
  PalParkEncounterArea({
    required this.baseScore,
    required this.rate,
    required this.area,
  });
}
