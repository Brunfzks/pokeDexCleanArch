import 'package:poke_clean_arch/app/pokemon/infra/models/effect_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ItemFlingEffect {
  final int id;
  final String name;
  final List<EffectModel> effectEntries;
  final List<NamedApiResourceModel> items;
  ItemFlingEffect({
    required this.id,
    required this.name,
    required this.effectEntries,
    required this.items,
  });
}
