import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/item_category.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class itemCategoryModel implements ItemCategory {
  @override
  final int id;

  @override
  final List<NamedApiResourceModel> items;

  @override
  final String name;

  @override
  final List<NameModel> names;

  @override
  final NamedApiResourceModel pocket;
  itemCategoryModel({
    required this.id,
    required this.items,
    required this.name,
    required this.names,
    required this.pocket,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'items': items.map((x) => x.toMap()).toList(),
      'name': name,
      'names': names.map((x) => x.toMap()).toList(),
      'pocket': pocket.toMap(),
    };
  }

  factory itemCategoryModel.fromMap(Map<String, dynamic> map) {
    return itemCategoryModel(
      id: map['id']?.toInt() ?? 0,
      items: List<NamedApiResourceModel>.from(
          map['items']?.map((x) => NamedApiResourceModel.fromMap(x))),
      name: map['name'] ?? '',
      names:
          List<NameModel>.from(map['names']?.map((x) => NameModel.fromMap(x))),
      pocket: NamedApiResourceModel.fromMap(map['pocket']),
    );
  }

  String toJson() => json.encode(toMap());

  factory itemCategoryModel.fromJson(String source) =>
      itemCategoryModel.fromMap(json.decode(source));
}
