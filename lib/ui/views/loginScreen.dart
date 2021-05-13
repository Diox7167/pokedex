import 'package:flutter/material.dart';
import 'package:pokedex/ui/widgets/login/startWidget.dart';
import 'package:pokedex/ui/widgets/login/chooseNameWidget.dart';
import 'package:ripple_effect/ripple_effect.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedScreen = 0;

  final pageKey = RipplePage.createGlobalKey();
  final effectKey = RippleEffect.createGlobalKey();

  Widget selectedWidget(int isSelected, Size screenSize) {
    switch (isSelected) {
      case 0:
        {
          return StartWidget(
            screenSize: screenSize,
            onSelectedScreen: (value) {
              setState(() {
                selectedScreen = value;
              });
            },
          );
        }
      case 1:
        {
          return ChooseNameWidget(
            pageKey: pageKey,
            effectKey: effectKey,
            screenSize: screenSize,
          );
        }

      default:
        {
          return Container();
        }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return RipplePage(
      pageKey: pageKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Material(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30.0),
                          ),
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30.0),
                              ),
                            ),
                            height: screenSize.height / 3,
                            width: screenSize.width,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/app/pokeball_icon.png'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height / 20,
                        ),
                        Text(
                          'POKEDEX',
                          style: TextStyle(
                            fontFamily: 'ArcadeClassic',
                            fontSize: 42.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: selectedWidget(selectedScreen, screenSize),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
