import 'package:flutter/material.dart';
import 'package:poke_team_app/infraestructure/utils/widgets/simple_txt.dart';
import 'package:poke_team_app/infraestructure/utils/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 40),
                  width: double.infinity,
                  height: 300,
                  child: Image.asset('lib/assets/images/poke_login.png')),
              customText("Let's sign in to your account of PokéTeamApp", 30,
                  maxLines: 2, textAlign: TextAlign.center),
              const SizedBox(height: 50),
              customText('Provide the username of your account', 20,
                  fontWeight: FontWeight.bold),
              SimpleTxt(
                  keyboardType: TextInputType.text,
                  controlador: usernameCtrl,
                  onChange: (valor) => setState(() {}),
                  color: Colors.grey[300],
                  icon: Icons.person_3_outlined,
                  texto: 'Username'),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                margin: const EdgeInsets.only(bottom: 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customText("Let's go to explore", 19),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[300]),
                        onPressed: () async {
                          final nav = Navigator.of(context);
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();

                          if (usernameCtrl.text.isEmpty) {
                            customToast(
                              'Please, before this, you must be provide a valid username',
                            );
                            return;
                          }

                          String? username =
                              sharedPreferences.getString('username');

                          if (username != usernameCtrl.text.trim()) {
                            customToast(
                              'The username that you provided is incorrect',
                            );
                            return;
                          }
                          nav.pushNamed('home_page');
                          customToast('Congrats, you have login correctly',
                              type: true);
                        },
                        child:
                            customText('->', 18, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: customText(
                    'All the information displayed in this application is obtained from a public API called PokeApi',
                    15,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
