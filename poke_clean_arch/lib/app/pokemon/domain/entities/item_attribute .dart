import 'package:poke_clean_arch/app/pokemon/infra/models/description_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/name_model.dart';
import 'package:poke_clean_arch/app/pokemon/infra/models/named_api_resource_model.dart';

class ItemAttribute {
  final int id;
  final String name;
  final List<NamedApiResourceModel> items;
  final List<NameModel> names;
  final List<DescriptionModel> descriptions;

  ItemAttribute(this.id, this.name, this.items, this.names, this.descriptions);
}
