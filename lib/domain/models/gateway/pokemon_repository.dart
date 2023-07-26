import 'package:poke_team_app/domain/models/poke_info.dart';

abstract class PokemonRepository {
  Future<List<PokemonInfo>> getInitialPokemonData();
}