import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/ui/views/overviewScreen.dart';
import 'package:pokedex/ui/widgets/snackbars/errorSnackBar.dart';
import 'package:ripple_effect/ripple_effect.dart';
import 'package:diacritic/diacritic.dart';

class ChooseNameWidget extends StatefulWidget {
  final GlobalKey pageKey;
  final GlobalKey effectKey;
  final Size screenSize;

  const ChooseNameWidget(
      {Key key, this.pageKey, this.effectKey, this.screenSize})
      : super(key: key);

  @override
  _ChooseNameWidgetState createState() => _ChooseNameWidgetState();
}

class _ChooseNameWidgetState extends State<ChooseNameWidget> {
  TextEditingController _pseudoTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Image(
            height: widget.screenSize.height / 5,
            image: AssetImage('assets/images/app/trainer.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Quel est ton nom",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: "ArcadeClassic",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: _pseudoTextController,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 24.0,
                            fontFamily: "ArcadeClassic",
                          ),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                            ),
                            border: InputBorder.none,
                            hintText: 'Nom',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 24.0,
                              fontFamily: "ArcadeClassic",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: RippleEffect(
                          pageKey: widget.pageKey,
                          effectKey: widget.effectKey,
                          color: Colors.red,
                          child: IconButton(
                            onPressed: () async {
                              if (_pseudoTextController.text.isNotEmpty) {
                                await user
                                    .setPseudo(removeDiacritics(
                                        _pseudoTextController.text))
                                    .then((value) {
                                  if (mounted) {
                                    RippleEffect.start(
                                        widget.effectKey, toOverviewScreen);
                                  }
                                });
                              } else {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(ErrorSnackBar(
                                  text: "Entrer un nom",
                                ));
                              }
                            },
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> toOverviewScreen() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OverviewScreen(
            screenSize: widget.screenSize,
          ),
        ),
      );
}
