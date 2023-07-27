import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';

class Languages {
  final int id;
  final String name;
  final bool official;
  final String iso639;
  final String iso3166;
  final List<NameModel> names;
  Languages({
    required this.id,
    required this.name,
    required this.official,
    required this.iso639,
    required this.iso3166,
    required this.names,
  });
}
