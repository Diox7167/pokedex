import 'package:flutter/material.dart';

class StartWidget extends StatefulWidget {
  final Function onSelectedScreen;
  final Size screenSize;

  const StartWidget({Key key, this.onSelectedScreen, this.screenSize})
      : super(key: key);

  @override
  _StartWidgetState createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Image(
            height: widget.screenSize.height / 5,
            image: AssetImage('assets/images/app/professor_oak.png'),
          ),
        ),
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Bonjour !",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "ArcadeClassic",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Bienvenue dans le monde des Pokemons',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "ArcadeClassic",
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: widget.screenSize.width / 2,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.onSelectedScreen(1);
                });
              },
              child: Center(
                child: Text(
                  'Commencer',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "ArcadeClassic",
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
