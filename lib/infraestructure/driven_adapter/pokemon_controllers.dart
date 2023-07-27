import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:poke_team_app/domain/models/gateway/pokemon_repository.dart';

import '../../domain/models/all_poke_info.dart';

class PokemonRepositoryControllers implements PokemonRepository{

  String mainUrl = '/api/v2/pokemon';

  @override
  Future<List<PokemonInfo>> getInitialPokemonData() async {

    try {

      List<PokemonInfo> data = [];

      for( int i = 1; i < 3; i++ ){

        final response = await http.get(
          Uri.https(dotenv.env['api_url']!, '$mainUrl/$i'),
          headers: { 'Content-Type': 'application/json' });

        if( response.statusCode != 200 ){
          return [];
        }

        final decodeData = json.decode(response.body) as Map<String, dynamic>;
        data.add(PokemonInfo.fromJson(decodeData));

      }
      
      return data;
    
    } on HttpException catch (_) {
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


