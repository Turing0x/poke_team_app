import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:poke_team_app/router/router.dart';
import 'package:poke_team_app/utils/initialPath.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initalPath = await initialPath();

  await dotenv.load(fileName: '.env');

  runApp(MyApp(
    initialRoute: initalPath,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: appRoutes,
        initialRoute: initialRoute);
  }
}
