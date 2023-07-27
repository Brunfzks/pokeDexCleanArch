import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/item_pocket.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ItemPocketModel implements ItemPocket {
  @override
  final List<NamedApiResourceModel> categories;

  @override
  final int id;

  @override
  final String name;

  @override
  final List<NameModel> names;

  ItemPocketModel(this.categories, this.id, this.name, this.names);

  Map<String, dynamic> toMap() {
    return {
      'categories': categories.map((x) => x.toMap()).toList(),
      'id': id,
      'name': name,
      'names': names.map((x) => x.toMap()).toList(),
    };
  }

  factory ItemPocketModel.fromMap(Map<String, dynamic> map) {
    return ItemPocketModel(
      List<NamedApiResourceModel>.from(
          map['categories']?.map((x) => NamedApiResourceModel.fromMap(x))),
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      List<NameModel>.from(map['names']?.map((x) => NameModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemPocketModel.fromJson(String source) =>
      ItemPocketModel.fromMap(json.decode(source));
}
