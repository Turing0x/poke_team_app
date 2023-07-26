import 'package:flutter/material.dart';
import 'package:poke_team_app/infraestructure/utils/extensions/string.dart';
import 'package:poke_team_app/infraestructure/utils/widgets/widgets.dart';
import 'package:poke_team_app/infraestructure/driven_adapter/pokemon_controllers.dart';
import 'package:poke_team_app/domain/models/poke_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: SafeArea(
  
        child: Padding(

          padding: const EdgeInsets.only(left: 25, top: 30, right: 25),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
        
              topHeader(),

              const SizedBox(height: 20),
        
              const Expanded(child: ShowList())
        
            ],
        
          ),
        )
      
      )
    
    );
  
  }

  Row topHeader() {
    return Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
      children: [
        customText('PokeTeam App', 35, fontWeight: FontWeight.bold),

        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.settings_suggest_rounded)
        )
      
      ],
    
    );

  }

}

class ShowList extends StatelessWidget {
  const ShowList({super.key});

  @override
  Widget build(BuildContext context) {

    final pokemonCtrl = PokemonRepositoryControllers();
    
    return Scaffold(
      body: FutureBuilder(
        future: pokemonCtrl.getInitialPokemonData(),
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: customText('Cargando datos', 18));
          }
          
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: customText('aqui no hay naj', 18));
          }
        
          final data = snapshot.data;
        
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
            itemCount: data!.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
        
              return Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                color: Colors.blue[300],
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    infoPoke(data, index),

                    loadImage(data[index].sprites.frontDefault)
              
                  ],
                    
                ),
                    
              );
            
            },
          
          );
        
        },
      
      ),

    );
  
  }

  Padding infoPoke(List<PokemonInfo> data, int index) {
    
    return Padding(
    
      padding: const EdgeInsets.only(top: 20, left: 15),
      child: Column( crossAxisAlignment: CrossAxisAlignment.start,
    
        children: [
    
          customText(
            data[index].name.withUpper(), 20, 
            color: Colors.white, 
            fontWeight: FontWeight.bold),
          
          const SizedBox(height: 20),
    
          Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: data[index].types.map((e) => seeStats(e.type.name.withUpper())).toList(),
          )
    
        ],
    
      ),
    
    );
  
  }

  Container seeStats( String stats ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(20)
      ),
      child: customText(stats, 16, color: Colors.white));
  }

  Align loadImage( String imageUrl ) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(right: 25, bottom: 15),
        child: Image.network(imageUrl)),
    );
  }

}
