import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/item_fling_effect.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/effect_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ItemFlingEffectModel implements ItemFlingEffect {
  @override
  final List<EffectModel> effectEntries;

  @override
  final int id;

  @override
  final List<NamedApiResourceModel> items;

  @override
  final String name;
  ItemFlingEffectModel({
    required this.effectEntries,
    required this.id,
    required this.items,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'effectEntries': effectEntries.map((x) => x.toMap()).toList(),
      'id': id,
      'items': items.map((x) => x.toMap()).toList(),
      'name': name,
    };
  }

  factory ItemFlingEffectModel.fromMap(Map<String, dynamic> map) {
    return ItemFlingEffectModel(
      effectEntries: List<EffectModel>.from(
          map['effectEntries']?.map((x) => EffectModel.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
      items: List<NamedApiResourceModel>.from(
          map['items']?.map((x) => NamedApiResourceModel.fromMap(x))),
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemFlingEffectModel.fromJson(String source) =>
      ItemFlingEffectModel.fromMap(json.decode(source));
}
