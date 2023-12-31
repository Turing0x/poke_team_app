import 'package:flutter/material.dart';

import 'package:poke_team_app/design/poke_info_page.dart';

MaterialPageRoute<dynamic>? onGenerateRoute ( RouteSettings settings ) {

  final argumentos = settings.arguments as List;

  Map<String, MaterialPageRoute> argRoutes = {
  
    'poke_info_page': MaterialPageRoute(
      builder: (_) => PokeInfoPage(
        pokeData: argumentos[0],
        scaffoldBackgroundColor: argumentos[1],
      ))
  
  };

  return argRoutes[settings.name];

}