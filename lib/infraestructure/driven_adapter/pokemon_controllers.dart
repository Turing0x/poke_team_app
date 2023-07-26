import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:poke_team_app/domain/models/gateway/pokemon_repository.dart';
import 'package:poke_team_app/domain/models/main_info.dart';
import 'package:poke_team_app/domain/models/poke_info.dart';

class PokemonRepositoryControllers implements PokemonRepository{

  String mainPath = '/api/v2';
  String colorPath = 'pokeapi.co/api/v2/pokemon-color';

  @override
  Future<List<PokemonInfo>> getInitialPokemonData() async {

    final queryData = {'limit': '3'};

    try {
      
      final response = await http.get(
        Uri.https(dotenv.env['api_url']!, '$mainPath/pokemon', queryData),
        headers: { 'Content-Type': 'application/json' });

      if( response.statusCode != 200 ){
        return [];
      }

      List<PokemonInfo> data = [];

      final decodeData = json.decode(response.body) as Map<String, dynamic>;
      for( var each in decodeData['results'] ){

        MainInfo mainInfo = MainInfo.fromJson(each);

        Response response = await http.get( Uri.parse(mainInfo.url),
          headers: { 'Content-Type': 'application/json' });
        
        final decodeData = json.decode(response.body) as Map<String, dynamic>;
        data.add(PokemonInfo.fromJson(decodeData));

      }

      return data;
    
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }

}


