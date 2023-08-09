import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/ability.dart';

class AbilityModel implements Ability {
  @override
  final String name;

  @override
  final String url;

  AbilityModel({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory AbilityModel.fromMap(Map<String, dynamic> map) {
    return AbilityModel(
      name: map['ability']['name'] ?? '',
      url: map['ability']['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AbilityModel.fromJson(String source) =>
      AbilityModel.fromMap(json.decode(source));
}
