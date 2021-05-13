import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/ui/views/loginScreen.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.red.withOpacity(0.9),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  width: screenSize.width / 4,
                  image: AssetImage('assets/images/app/trainer_icon.png'),
                ),
              ),
              Text(
                'Nom du dresseur',
                style: TextStyle(
                  fontFamily: 'ArcadeClassic',
                  fontSize: 36.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Divider(
                  color: Colors.white,
                  thickness: 3,
                ),
              ),
              Text(
                user.pseudo,
                style: TextStyle(
                  fontFamily: 'ArcadeClassic',
                  fontSize: 32.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    user.logOut().then((value) {
                      if (mounted) {
                        Navigator.of(context).pop(true);
                        //toLoginScreen();
                        //RippleEffect.start(effectKey, toLoginScreen);
                        //Navigator.of(context).pop(true);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text(
                    'Deconnexion',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontFamily: 'ArcadeClassic',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> toLoginScreen() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
}
