import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poke_team_app/infraestructure/utils/extensions/string.dart';
import 'package:poke_team_app/config/bloc/pokemon/pokemon_bloc.dart';
import 'package:poke_team_app/design/common/widgets.dart';

import '../domain/models/all_poke_info.dart';
import '../infraestructure/utils/colors.dart';
import '../infraestructure/utils/file_manager.dart';
import '../infraestructure/utils/load_network_svg.dart';
import '../infraestructure/utils/permission.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    
    permissionStorage().then((value) async {
      
      if (!value) {
        await permissionStorage();
      }
      
      await readAllFilesAndSaveInMaps();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: SafeArea(
  
        child: Padding(

          padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
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

    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        return Scaffold(
          body: FutureBuilder(
            future: state.getInitialPokemonData(),
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
                  crossAxisCount: 2, mainAxisExtent: 180),
                itemCount: data!.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {

                  String forColor = data[index].types.first.type.name;
                  Color? backColor = backgroundColor[forColor];

                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed('poke_info_page', arguments: [
                      data[index], backColor
                    ]),
                    child: Card(
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      color: backColor,
                      child: Stack(
                  
                        children: [
                  
                          const Positioned(
                            right: -20,
                            bottom: -20,
                            child: Icon(
                              Icons.catching_pokemon_outlined, 
                              color: Colors.white24,
                              size: 140)),
                  
                          infoPoke(data[index], index),
                      
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: loadNetworkSvg(data[index].sprites.other.dreamWorld.frontDefault))
                  
                        ],
                  
                      )
                          
                    ),
                  );
                
                },
              
              );
            
            },
          
          ),
    
        );
      },
    );
  
  }

  Padding infoPoke(PokemonInfo data, int index) {
    
    return Padding(
    
      padding: const EdgeInsets.only(top: 10, left: 15),
      child: Column( crossAxisAlignment: CrossAxisAlignment.start,
    
        children: [
    
          customText(
            '#${data.id.toString().addZero(3)}', 18, 
            color: Colors.grey[800],
            fontWeight: FontWeight.bold),

          customText(
            data.name.withUpper(), 20, 
            color: Colors.white, 
            fontWeight: FontWeight.bold),

          const SizedBox(height: 10),
          
          Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: data.types.map((e) => seeStats(e.type.name.withUpper())).toList(),
          )
    
        ],
    
      ),
    
    );
  
  }

  Widget seeStats( String stats ) => customText(stats, 16, color: Colors.white);

}
