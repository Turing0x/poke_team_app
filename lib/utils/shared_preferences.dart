import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences _prefs;

  SharedPrefs() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences getPrefs() {
    return _prefs;
  }

  // Mathods to save thinks
  saveUsername(String username) {
    _prefs.setString('username', username);
  }

  // Methods to get thinks
  String? getUsername() {
    return _prefs.getString('username');
  }
}
