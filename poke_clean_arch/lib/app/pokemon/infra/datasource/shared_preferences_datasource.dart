import 'package:poke_clean_arch/app/pokemon/usescases/shared_preferences_get/shared_preferences_get.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/shared_preferences_save/shared_preferences_save.dart';

abstract class SharedPreferencesDataSource {
  Future<bool> savePreferences(ParamnsSharedPreferencesSave params);
  Future<String> getPreferences(ParamnsSharedPreferencesGet params);
}
