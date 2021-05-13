import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/ui/views/loginScreen.dart';
import 'package:pokedex/ui/views/pokedexScreen.dart';
import 'package:pokedex/ui/views/accountScreen.dart';
import 'package:pokedex/ui/widgets/snackbars/errorSnackBar.dart';

class OverviewScreen extends StatefulWidget {
  final Size screenSize;

  const OverviewScreen({Key key, this.screenSize}) : super(key: key);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              right: widget.screenSize.width / -5,
              top: -70,
              child: Container(
                height: 300.0,
                width: widget.screenSize.width / 1.5,
                child: Image(
                  image: AssetImage('assets/images/app/pokeball_bg.png'),
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: widget.screenSize.height / 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              if (mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AccountScreen(),
                                  ),
                                ).then((value) {
                                  if (value) {
                                    if (mounted == true) {
                                      toLoginScreen();
                                    }
                                  }
                                });
                              }
                            },
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                            child: Image(
                              width: widget.screenSize.width / 4,
                              image: AssetImage(
                                  'assets/images/app/trainer_icon.png'),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Bonjour \n' + user?.pseudo + " !",
                            style: TextStyle(
                              fontSize: 26.0,
                              fontFamily: 'ArcadeClassic',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PokedexScreen(
                                  screenSize: widget.screenSize,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Image(
                              image: AssetImage(
                                  'assets/images/app/pokeball_item1.png'),
                            ),
                            title: Text(
                              'Pokedex',
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 20.0,
                                fontFamily: 'ArcadeClassic',
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();

                            ScaffoldMessenger.of(context)
                                .showSnackBar(ErrorSnackBar(
                              text: "Nope !",
                            ));
                          },
                          child: ListTile(
                            leading: Image(
                              image: AssetImage(
                                  'assets/images/app/pokeball_item2.png'),
                            ),
                            title: Text(
                              'Mouvements',
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 20.0,
                                fontFamily: 'ArcadeClassic',
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();

                            ScaffoldMessenger.of(context)
                                .showSnackBar(ErrorSnackBar(
                              text: "Nope !",
                            ));
                          },
                          child: ListTile(
                            leading: Image(
                              image: AssetImage(
                                  'assets/images/app/pokeball_item3.png'),
                            ),
                            title: Text(
                              'Competences',
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 20.0,
                                fontFamily: 'ArcadeClassic',
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();

                            ScaffoldMessenger.of(context)
                                .showSnackBar(ErrorSnackBar(
                              text: "Nope !",
                            ));
                          },
                          child: ListTile(
                            leading: Image(
                              image: AssetImage(
                                  'assets/images/app/pokeball_item4.png'),
                            ),
                            title: Text(
                              'Objets',
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 20.0,
                                fontFamily: 'ArcadeClassic',
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();

                            ScaffoldMessenger.of(context)
                                .showSnackBar(ErrorSnackBar(
                              text: "Nope !",
                            ));
                          },
                          child: ListTile(
                            leading: Image(
                              image: AssetImage(
                                  'assets/images/app/pokeball_item5.png'),
                            ),
                            title: Text(
                              'Map',
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 20.0,
                                fontFamily: 'ArcadeClassic',
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();

                            ScaffoldMessenger.of(context)
                                .showSnackBar(ErrorSnackBar(
                              text: "Nope !",
                            ));
                          },
                          child: ListTile(
                            leading: Image(
                              image: AssetImage(
                                  'assets/images/app/pokeball_item6.png'),
                            ),
                            title: Text(
                              'Types',
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 20.0,
                                fontFamily: 'ArcadeClassic',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> toAccountScreen() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccountScreen(),
        ),
      ).then((value) {
        if (value) {
          toLoginScreen();
        }
      });

  Future<void> toLoginScreen() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
}
