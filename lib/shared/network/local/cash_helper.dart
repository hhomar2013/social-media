import 'package:shared_preferences/shared_preferences.dart';
//   shared_preferences: ^2.2.2
class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async { // starting point
    sharedPreferences = await SharedPreferences.getInstance(); // create file
  }
  static Future<bool> putData({  // saving
    required String key ,
    required bool value ,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static Future<bool> saveData({  // saving uId
    required String key ,
    required String value ,
  }) async {
    return await sharedPreferences.setString(key, value);
  }

  static bool  getData({ // getting data
    required String key ,
  }){
      return sharedPreferences.getBool(key) ?? false ;
    }

  static String getData2({ // getting data
    required String key ,
  }){
    return sharedPreferences.getString(key) ?? 'false';
  }

}