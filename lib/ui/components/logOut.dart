import 'package:shared_preferences/shared_preferences.dart';

class LogOut {
  Future<void> clearLoginCredentialToSharedPref(
     // String username, String password
      ) async {
    final pref = await SharedPreferences.getInstance();

    //prefs.setStringList('my_string_list_key', ['horse', 'cow', 'sheep']);

    final credentials = pref.clear();
    //('credentials', [username, password]);
  }
}
