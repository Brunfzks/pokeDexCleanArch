import 'package:poke_clean_arch/app/pokemon/infra/datasource/shared_preferences_datasource.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/shared_preferences_get/shared_preferences_get.dart';
import 'package:poke_clean_arch/app/pokemon/usescases/shared_preferences_save/shared_preferences_save.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesImpl implements SharedPreferencesDataSource {
  SharedPreferences sharedPreferences;
  SharedPreferencesImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> savePreferences(ParamnsSharedPreferencesSave params) async {
    try {
      return await sharedPreferences.setString(params.key, params.value);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<String> getPreferences(ParamnsSharedPreferencesGet params) async {
    try {
      return sharedPreferences.getString(params.key) ?? '';
    } catch (e) {
      throw Exception();
    }
  }
}
