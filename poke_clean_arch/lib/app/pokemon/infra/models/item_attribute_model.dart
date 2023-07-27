import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/item_attribute%20.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/description_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ItemAttributeModel implements ItemAttribute {
  @override
  final List<DescriptionModel> descriptions;

  @override
  final int id;

  @override
  final List<NamedApiResourceModel> items;

  @override
  final String name;

  @override
  final List<NameModel> names;
  ItemAttributeModel({
    required this.descriptions,
    required this.id,
    required this.items,
    required this.name,
    required this.names,
  });

  Map<String, dynamic> toMap() {
    return {
      'descriptions': descriptions.map((x) => x.toMap()).toList(),
      'id': id,
      'items': items.map((x) => x.toMap()).toList(),
      'name': name,
      'names': names.map((x) => x.toMap()).toList(),
    };
  }

  factory ItemAttributeModel.fromMap(Map<String, dynamic> map) {
    return ItemAttributeModel(
      descriptions: List<DescriptionModel>.from(
          map['descriptions']?.map((x) => DescriptionModel.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
      items: List<NamedApiResourceModel>.from(
          map['items']?.map((x) => NamedApiResourceModel.fromMap(x))),
      name: map['name'] ?? '',
      names:
          List<NameModel>.from(map['names']?.map((x) => NameModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemAttributeModel.fromJson(String source) =>
      ItemAttributeModel.fromMap(json.decode(source));
}
