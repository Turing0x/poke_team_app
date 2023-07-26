import 'package:flutter/material.dart';

import 'package:poke_team_app/design/register_page.dart';
import 'package:poke_team_app/design/login_page.dart';
import 'package:poke_team_app/design/home_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home_page': (_) => const HomePage(),
  'login_page': (_) => const LoginPage(),
  'register_page': (_) => const RegisterPage(),
};
