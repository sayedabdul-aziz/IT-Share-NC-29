import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static String NAME_KEY = 'NAME';
  static String IMAGE_KEY = 'IMAGE';
  static String IS_UPLOAD_KEY = 'IS_UPLOAD';
  static cacheData(String key, value) async {
    var pref = await SharedPreferences.getInstance();
    if (value is bool) {
      pref.setBool(key, value);
    } else {
      pref.setString(key, value);
    }
  }

  static Future<dynamic> getCachedData(String key) async {
    var pref = await SharedPreferences.getInstance();
    return pref.get(key);
  }
}
