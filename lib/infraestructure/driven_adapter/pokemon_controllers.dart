import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:poke_team_app/domain/models/gateway/pokemon_repository.dart';
import 'package:poke_team_app/domain/models/less_poke_info.dart';
import 'package:poke_team_app/domain/models/main_info.dart';

class PokemonRepositoryControllers implements PokemonRepository{

  String mainUrl = '/api/v2';
  String colorUrl = 'pokeapi.co/api/v2/pokemon-color';

  @override
  Future<List<LessPokemonInfo>> getInitialPokemonData() async {

    final queryData = {'limit': '1'};

    try {
      
      final response = await http.get(
        Uri.https(dotenv.env['api_url']!, '$mainUrl/pokemon', queryData),
        headers: { 'Content-Type': 'application/json' });

      if( response.statusCode != 200 ){
        return [];
      }

      List<LessPokemonInfo> data = [];

      final decodeData = json.decode(response.body) as Map<String, dynamic>;
      for( var each in decodeData['results'] ){

        MainInfo mainInfo = MainInfo.fromJson(each);

        Response responseData = await http.get( Uri.parse(mainInfo.url),
          headers: { 'Content-Type': 'application/json' });

        final decodeData = json.decode(responseData.body) as Map<String, dynamic>;

        data.add(LessPokemonInfo.fromJson(decodeData));

      }

      return data;
    
    } on Exception catch (_) {
      return [];
    }
  }

}


