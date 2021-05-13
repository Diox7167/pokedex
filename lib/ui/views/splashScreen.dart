import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/ui/views/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    super.initState();

    pokedex.getPokemons();

    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              /*Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: new Image.asset(
                    'assets/powered_by.png',
                    height: 25.0,
                    fit: BoxFit.scaleDown,
                  ))*/
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Application developpee par',
                      style: TextStyle(
                          fontFamily: 'ArcadeClassic',
                          fontSize: 14,
                          letterSpacing: 2),
                    ),
                    Text(
                      'BERNARD Ghislain',
                      style: TextStyle(
                          fontFamily: 'ArcadeClassic',
                          fontSize: 18,
                          letterSpacing: 2),
                    ),
                  ],
                ),
              )
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/app/pokeball_icon.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
