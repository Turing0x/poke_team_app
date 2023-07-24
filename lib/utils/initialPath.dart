import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> initialPath() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  String? username = sharedPreferences.getString('username');

  if (username!.isNotEmpty) {
    return 'login_page';
  }

  return 'register_page';
}
