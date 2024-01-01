import 'package:hive/hive.dart';

class AppLocal {
  static cacheData(String key, String value) {
    var box = Hive.box('user');
    box.put(key, value);
  }

  static Future<String> getcachedData(String key) async {
    var box = Hive.box('user');
    return await box.get(key);
  }
}
