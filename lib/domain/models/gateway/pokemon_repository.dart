import '../less_poke_info.dart';

abstract class PokemonRepository {
  Future<List<LessPokemonInfo>> getInitialPokemonData();
}