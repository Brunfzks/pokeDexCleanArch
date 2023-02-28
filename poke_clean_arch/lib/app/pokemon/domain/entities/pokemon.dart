import 'package:poke_clean_arch/app/pokemon/infra/models/types_model.dart';

class Pokemon {
  final String name;
  final int id;
  final String frontImg;
  final List<TypeModel> types;

  Pokemon({
    required this.name,
    required this.id,
    required this.frontImg,
    required this.types,
  });
}
