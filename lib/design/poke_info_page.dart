import 'package:flutter/material.dart';
import 'package:poke_team_app/design/common/widgets.dart';

class PokeInfoPage extends StatefulWidget {
  const PokeInfoPage({super.key, 
  required this.name});

  final String name;

  @override
  State<PokeInfoPage> createState() => _PokeInfoPageState();
}

class _PokeInfoPageState extends State<PokeInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
      
        child: SafeArea(
      
          child: Column(
        
            children: [
        
              customText(widget.name, 25)
        
            ],
        
          ),
      
        )
        
      ),
    
    );
  
  }

}