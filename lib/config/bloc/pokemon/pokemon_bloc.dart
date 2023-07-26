import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poke_team_app/infraestructure/driven_adapter/pokemon_controllers.dart';
import 'package:poke_team_app/domain/models/all_poke_info.dart';

import '../../../domain/models/less_poke_info.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
