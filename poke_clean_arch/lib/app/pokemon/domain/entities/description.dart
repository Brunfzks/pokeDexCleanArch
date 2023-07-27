import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class Description {
  final String name;
  final NamedApiResourceModel language;
  Description({
    required this.name,
    required this.language,
  });
}
