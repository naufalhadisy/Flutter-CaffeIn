import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  late SharedPreferences _sharedPreferences;

  Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setter(String key, String value) async {
    return _sharedPreferences.setString(key, value);
  }

  String? getter(String key) {
    return _sharedPreferences.getString(key);
  }

  void clearLocalStorage() {
    _sharedPreferences.clear();
  }

  Future deleteStore(String keyToDelete) async {
    final Set<String> keys = _sharedPreferences.getKeys();

    final it = keys.iterator;
    while (it.moveNext()) {
      final String key = it.current;
      if (key == keyToDelete) {
        _sharedPreferences.remove(key);
      }
    }
  }
}
