import 'package:poke_clean_arch/app/pokemon/domain/entities/named_api_resource.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/languages_model.dart';

class Genus {
  final String genus;
  final NamedApiResource language;
  Genus({
    required this.genus,
    required this.language,
  });
}
