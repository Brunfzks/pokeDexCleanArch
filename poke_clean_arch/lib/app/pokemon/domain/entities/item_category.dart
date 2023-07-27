import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ItemCategory {
  final int id;
  final String name;
  final List<NamedApiResourceModel> items;
  final List<NameModel> names;
  final NamedApiResourceModel pocket;
  ItemCategory({
    required this.id,
    required this.name,
    required this.items,
    required this.names,
    required this.pocket,
  });
}
