import '../all_poke_info.dart';

abstract class PokemonRepository {

  Future<List<PokemonInfo>> getInitialPokemonData();

  Future<PokemonInfo> getPokemonDataById( String pokeId );

}