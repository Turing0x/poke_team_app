import 'package:flutter/material.dart';

import 'package:poke_team_app/infraestructure/utils/extensions/string.dart';
import 'package:poke_team_app/infraestructure/utils/file_manager.dart';
import 'package:poke_team_app/infraestructure/utils/load_network_svg.dart';
import 'package:poke_team_app/design/common/widgets.dart';

import '../domain/models/all_poke_info.dart';

class PokeInfoPage extends StatefulWidget {
  const PokeInfoPage({super.key, 
    required this.scaffoldBackgroundColor,
    required this.pokeData,
  });

  final PokemonInfo pokeData;
  final Color scaffoldBackgroundColor;

  @override
  State<PokeInfoPage> createState() => _PokeInfoPageState();
}

class _PokeInfoPageState extends State<PokeInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: widget.scaffoldBackgroundColor,
      body: SafeArea(
    
        child: Column( mainAxisSize: MainAxisSize.min,
          children: [
    
            withPadding( widget.pokeData.id, widget.pokeData.name, widget.pokeData.types, widget.pokeData.sprites ),
    
            Expanded(child: ShowPokeInfo(
              backColor: widget.scaffoldBackgroundColor,
              pokemonInfo: widget.pokeData,
            ))
    
          ],
              
        ),
      
      )
    
    );
  
  }

  Padding withPadding( int id, String name, List<Type> types, Sprites sprites ) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          topHeader(),
          const SizedBox(height: 10),

          Stack(
            children: [

              const Positioned(
                right: 0,
                top: -10,
                child: Icon(
                  Icons.catching_pokemon_outlined, 
                  color: Colors.white12,
                  size: 180)),

              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                      '#${id.toString().addZero(3)}', 20, 
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold),
                    customText(
                      name.withUpper(), 25, 
                      color: Colors.white, 
                      fontWeight: FontWeight.bold),
                    const SizedBox(height: 10),
                    Row( crossAxisAlignment: CrossAxisAlignment.start,
                      children: types.map((e) => seeStats(e) ).toList(),
                    ),
                    ]
                  ),
            
                  loadNetworkSvg(sprites.other.dreamWorld.frontDefault, size: 150)
            
                ],
              ),
              
            ]
          )

      ]),
    );
  }

  Row topHeader() {
    return Row(
      children: [
    
        IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(Icons.keyboard_backspace_rounded, 
            color: Colors.white, 
            size: 30)),
    
        const Spacer(),
    
        IconButton(
          onPressed: (){
            setState(() {

              if( dataInsideFIle.containsValue(widget.pokeData.name) ){
                dataInsideFIle.removeWhere((key, value) => value == widget.pokeData.name);
                return;
              }

              dataInsideFIle.addAll({'name': widget.pokeData.name});
            
            });

            print(dataInsideFIle);

          },
          icon: Icon(Icons.favorite_rounded, 
            color: ( dataInsideFIle.containsValue(widget.pokeData.name)
              ? Colors.red : Colors.white ), size: 30)),
    
      ],
    );
  }

  Container seeStats( Type e ) => Container(
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.white)
    ),
    child: customText(e.type.name.withUpper(), 18, color: Colors.white),
  );
}

class ShowPokeInfo extends StatelessWidget {
  const ShowPokeInfo({super.key,
    required this.backColor,
    required this.pokemonInfo,
  });

  final Color backColor;
  final PokemonInfo pokemonInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50)
          )
        ),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              
              const ShowTabBar(),

              Expanded(
                child: TabBarView(
                  children: [
              
                    aboutInfo(),

                    statsInfo(),

                    movesInfo()
              
                  ]
                ),
              )

            ],
          )
        ),
      )
    );
  }

  Padding movesInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: ListView.builder(
        itemCount: pokemonInfo.moves.length,
        itemBuilder: (context, index) {
          return customText(pokemonInfo.moves[index].move.name.withUpper(), 
            20, fontWeight: FontWeight.bold);
        },
      ),
    );
  }

  Padding statsInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pokemonInfo.stats.map((e) => Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: customText(
                e.stat.name.withUpper().replaceAll('-', ' '),
                18, fontWeight: FontWeight.bold)
            )).toList(),),
          ),

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: pokemonInfo.stats.map((e) => Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: customText(
                e.baseStat.toString(), 18)
            )).toList(),),
          ),

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: pokemonInfo.stats.map((e) => Container(
              margin: const EdgeInsets.only(bottom: 44),
              child: LinearProgressIndicator(
                color: ( e.baseStat < 50 ) ? Colors.red : Colors.green,
                backgroundColor: Colors.grey[300],
                value: e.baseStat / 100))).toList()),
          )

      ],)
    );
  }

  Padding aboutInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,                      
        children: [
    
          boldLabel('Species: ', pokemonInfo.species.name.withUpper(), 20),
          const SizedBox(height: 20),
    
          boldLabel('Height: ', 
            ' ${(pokemonInfo.height / 10 / 2.54).toStringAsFixed(2)}in -- ( ${(pokemonInfo.height / 10)}cm )', 20), 
            const SizedBox(height: 20),
    
          boldLabel('Weight: ', 
            ' ${(pokemonInfo.weight / 10 * 2.205).toStringAsFixed(2)}lb -- ( ${(pokemonInfo.weight / 10)}kg )', 20),
            const SizedBox(height: 20),

          Row(
            children: [
              customText('Abilities: ', 20, fontWeight: FontWeight.bold),
              Row(
                children: 
                  pokemonInfo.abilities.map(
                    (e) => customText('${e.ability.name.withUpper()} ', 20)).toList())
            ],
          ),

        ],
      
      ),
    );
  }
}

class ShowTabBar extends StatelessWidget {
  const ShowTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(text: 'About'),
          Tab(text: 'Base Stats'),
          Tab(text: 'Moves')
        ],
      ),
    );
  }
}