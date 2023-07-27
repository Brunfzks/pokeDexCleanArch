import 'dart:convert';

import 'package:poke_clean_arch/app/pokemon/domain/entities/item_sprites.dart';

class ItemSpritesModel implements ItemSprites {
  @override
  final String default_;
  ItemSpritesModel({
    required this.default_,
  });

  Map<String, dynamic> toMap() {
    return {
      'default_': default_,
    };
  }

  factory ItemSpritesModel.fromMap(Map<String, dynamic> map) {
    return ItemSpritesModel(
      default_: map['default'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemSpritesModel.fromJson(String source) =>
      ItemSpritesModel.fromMap(json.decode(source));
}
