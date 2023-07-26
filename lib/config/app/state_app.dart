import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_team_app/config/bloc/pokemon/pokemon_bloc.dart';
import 'package:poke_team_app/main.dart';

class AppState extends StatelessWidget {
  const AppState({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
    
      providers: [
        BlocProvider<PokemonBloc>(create: (_) => PokemonBloc())
      ], 
      child: MyApp(initialRoute: initialRoute));
  
  }

}