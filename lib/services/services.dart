import 'package:shared_preferences/shared_preferences.dart';

class NewsServices{
  static SharedPreferences? preferences;
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putData({
    required String key,
    required bool value,
  }) async{
    return await preferences?.setBool(key, value);
  }

  static bool? getData({
    required String key,
}){
    return preferences?.getBool(key);
  }

}