import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ItemPocket {
  final int id;
  final String name;
  final List<NamedApiResourceModel> categories;
  final List<NameModel> names;
  ItemPocket({
    required this.id,
    required this.name,
    required this.categories,
    required this.names,
  });
}
