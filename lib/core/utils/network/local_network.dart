import 'package:shared_preferences/shared_preferences.dart';

class cashNetwork{
  static late SharedPreferences sharedpref;
  static cashInitialization()async{
    sharedpref = await SharedPreferences.getInstance();
  }

  static Future<bool> insertToCash({required String key,required String value})async{
    return await sharedpref.setString(key, value);
  }
  static Future<bool> insertToCashboll({required String key,required bool value})async{
    return await sharedpref.setBool(key, value);
  }
  static String getCashData({required String key}){
    return sharedpref.getString(key) ?? "";
  }
  static bool getCashDataboll({required String key}){
    return sharedpref.getBool(key)?? true;
  }
  static Future<bool> removeFromCash({required String key})async{
    return await sharedpref.remove(key);
  }
}