import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:poke_team_app/domain/models/gateway/pokemon_repository.dart';
import 'package:poke_team_app/domain/models/main_info.dart';

import '../../domain/models/all_poke_info.dart';

class PokemonRepositoryControllers implements PokemonRepository{

  String mainUrl = '/api/v2';
  String colorUrl = 'pokeapi.co/api/v2/pokemon-color';

  String specieUrl = 'pokeapi.co/api/v2/pokemon-species';

  @override
  Future<List<PokemonInfo>> getInitialPokemonData() async {

    final queryData = {'limit': '1'};

    try {
      
      final response = await http.get(
        Uri.https(dotenv.env['api_url']!, '$mainUrl/pokemon', queryData),
        headers: { 'Content-Type': 'application/json' });

      if( response.statusCode != 200 ){
        return [];
      }

      List<PokemonInfo> data = [];

      final decodeData = json.decode(response.body) as Map<String, dynamic>;
      MainInfo mainInfo = MainInfo.fromJson(decodeData['results'][0]);

      Response responseData = await http.get( Uri.parse(mainInfo.url),
        headers: { 'Content-Type': 'application/json' });

      final decodeDataA = json.decode(responseData.body) as Map<String, dynamic>;

      data.add(PokemonInfo.fromJson(decodeDataA));
          
      return data;
    
    } on HttpException catch (e) {
      print(e);
      return [];
    }
  }
  
  @override
  Future<PokemonInfo> getPokemonDataById(String pokeId) async {

    try {
      
      final response = await http.get(
        Uri.https(dotenv.env['api_url']!, '$mainUrl/pokemon/$pokeId'),
        headers: { 'Content-Type': 'application/json' });

      if( response.statusCode != 200 ){
        throw UnimplementedError();
      }

      final decodeData = json.decode(response.body) as Map<String, dynamic>;
      return PokemonInfo.fromJson(decodeData);
    
    } on Exception catch (_) {
      throw UnimplementedError();
    }
    
  }

}


