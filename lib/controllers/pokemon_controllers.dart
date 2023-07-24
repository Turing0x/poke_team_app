import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:poke_team_app/models/main_info.dart';

Future<List<MainInfo>> getInitialPokemonData() async {
  final queryData = {'limit': '1'};

  try {
    final response = await http.get(
        Uri.https(dotenv.env['api_url']!, '/api/v2/pokemon', queryData),
        headers: {
          'Content-Type': 'application/json',
        });

    List<MainInfo> data = [];

    final decodeData = json.decode(response.body) as Map<String, dynamic>;
    decodeData['results'].forEach((pokemon) {
      data.add(MainInfo.fromJson(pokemon));
    });

    return data;
  } on Exception catch (_) {
    return [];
  }
}
