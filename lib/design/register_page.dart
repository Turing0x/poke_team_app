import 'package:flutter/material.dart';
import 'package:poke_team_app/infraestructure/utils/widgets/simple_txt.dart';
import 'package:poke_team_app/infraestructure/utils/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  margin: const EdgeInsets.only(top: 50, bottom: 40, left: 30),
                  width: double.infinity,
                  height: 300,
                  child: Image.asset('lib/assets/images/poke_register.png')),
              customText("Let's create you an account in PokéTeamApp", 30,
                  maxLines: 2, textAlign: TextAlign.center),
              const SizedBox(height: 50),
              customText('Provide a username for you access', 20,
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
                child: ElevatedButton(
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
                      sharedPreferences.setString(
                          'username', usernameCtrl.text.trim());
                      customToast(
                          'Congrats, the username has been saved correctly',
                          type: true);

                      nav.pushNamed('home_page');
                    },
                    child: customText('Create account', 18)),
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
