import 'package:flutter/material.dart';
import 'package:poke_team_app/assets/widgets/widgets.dart';
import 'package:poke_team_app/controllers/pokemon_controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => getInitialPokemonData(),
            child: customText('text', 18)),
      ),
    );
  }
}
