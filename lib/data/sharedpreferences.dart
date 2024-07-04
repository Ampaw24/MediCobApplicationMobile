import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUser {
  static saveStringShared(
      {required String value, required String keypair}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(value, keypair);
  }

  static saveboolShared({required String value, required bool keypair}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(value, keypair);
  }

  static getBool({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool(key);
  }

}
