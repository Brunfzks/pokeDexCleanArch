import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class FlavorText {
  final String flavorText;
  final NamedApiResourceModel language;
  final NamedApiResourceModel version;
  FlavorText({
    required this.flavorText,
    required this.language,
    required this.version,
  });
}
