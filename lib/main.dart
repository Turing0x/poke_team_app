import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:poke_team_app/infraestructure/utils/initial_path.dart';
import 'package:poke_team_app/config/router/on_generate_route.dart';
import 'package:poke_team_app/config/router/router.dart';
import 'package:poke_team_app/config/app/state_app.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  final initalPath = await initialPath();

  await dotenv.load(fileName: '.env');

  runApp(AppState( initialRoute: initalPath ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,

    );
  
  }

}
