part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {

  Future<List<PokemonInfo>> getInitialPokemonData();

  Future<PokemonInfo> getPokemonDataById( String pokeId );

}

class PokemonInitial extends PokemonState {

  final pokemonRepository = PokemonRepositoryControllers();

  @override
  Future<List<PokemonInfo>> getInitialPokemonData() 
    => pokemonRepository.getInitialPokemonData();
    
  @override
  Future<PokemonInfo> getPokemonDataById( String pokeId ) async{
    return await pokemonRepository.getPokemonDataById(pokeId);
  }

}
