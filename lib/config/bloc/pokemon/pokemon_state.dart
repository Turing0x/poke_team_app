part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {
  Future<List<LessPokemonInfo>> getPokemonData();
}

class PokemonInitial extends PokemonState {

  final pokemonRepository = PokemonRepositoryControllers();

  @override
  Future<List<LessPokemonInfo>> getPokemonData() 
    => pokemonRepository.getInitialPokemonData();

}
