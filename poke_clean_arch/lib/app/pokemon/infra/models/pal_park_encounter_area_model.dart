import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/pal_park_encounter_area.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class PalParkEncounterAreaModel implements PalParkEncounterArea {
  @override
  final NamedApiResourceModel area;

  @override
  final int baseScore;

  @override
  final int rate;
  PalParkEncounterAreaModel({
    required this.area,
    required this.baseScore,
    required this.rate,
  });

  Map<String, dynamic> toMap() {
    return {
      'area': area.toMap(),
      'baseScore': baseScore,
      'rate': rate,
    };
  }

  factory PalParkEncounterAreaModel.fromMap(Map<String, dynamic> map) {
    return PalParkEncounterAreaModel(
      area: NamedApiResourceModel.fromMap(map['area']),
      baseScore: map['base_score']?.toInt() ?? 0,
      rate: map['rate']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PalParkEncounterAreaModel.fromJson(String source) =>
      PalParkEncounterAreaModel.fromMap(json.decode(source));
}
