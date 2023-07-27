import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class VersionGroupFlavorText {
  final String text;
  final NamedApiResourceModel language;
  final NamedApiResourceModel versionGroup;
  VersionGroupFlavorText({
    required this.text,
    required this.language,
    required this.versionGroup,
  });
}
