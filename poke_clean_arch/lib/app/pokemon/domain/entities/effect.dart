import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class Effect {
  final String effect;
  final NamedApiResourceModel language;

  Effect(this.effect, this.language);
}
