import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/stores/pokemonStore.dart';
import 'package:pokedex/ui/widgets/pokemon/statsWidget.dart';
import 'package:pokedex/ui/widgets/pokemon/informationsWidget.dart';

class PokemonScreen extends StatefulWidget {
  final PokemonStore pokemon;
  final Color typeColor;
  final bool isFavorite;
  final Function newFavorite;

  const PokemonScreen(
      {Key key,
      this.pokemon,
      this.typeColor,
      this.isFavorite,
      this.newFavorite})
      : super(key: key);

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  int selectedScreen = 0;
  bool newFavorite;

  Widget selectedWidget(int isSelected) {
    switch (isSelected) {
      case 0:
        {
          return StatsWidget(
            pokemon: widget.pokemon,
            typeColor: widget.typeColor,
          );
        }
      case 1:
        {
          return InformationsWidget(
            pokemon: widget.pokemon,
            typeColor: widget.typeColor,
          );
        }

      default:
        {
          return Container();
        }
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      newFavorite = widget.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenSize.height / 2.2,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      widget.typeColor,
                      widget.typeColor.withOpacity(0.6)
                    ]),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  ),
                  height: screenSize.height / 3,
                ),
                Positioned(
                    top: screenSize.height / 6,
                    width: screenSize.width,
                    child: Container(
                      width: screenSize.width / 2,
                      height: screenSize.height / 4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/pokemon/${widget.pokemon.id}.png'),
                            fit: BoxFit.contain),
                      ),
                    )),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.pokemon.name.french,
                              style: TextStyle(
                                fontSize: 28.0,
                                fontFamily: 'ArcadeClassic',
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              '#' + widget.pokemon.id.toString(),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'ArcadeClassic',
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            for (final dynamic type in widget.pokemon.types)
                              Image(
                                width: 30.0,
                                image: AssetImage(
                                    'assets/images/types/${type.toString()}.png'),
                              )
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            if (!widget.isFavorite) {
                              user.addFavorite(widget.pokemon);
                            } else {
                              user.removeFavorite(widget.pokemon);
                            }
                            setState(() {
                              newFavorite = !newFavorite;
                            });
                            widget.newFavorite(newFavorite);
                          },
                          icon: newFavorite
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                ),
                        )
                      ],
                    ),
                    Divider(
                      color: widget.typeColor,
                      thickness: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                widget.typeColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedScreen = 0;
                            });
                          },
                          child: Text(
                            'Statistiques',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'ArcadeClassic',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                widget.typeColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedScreen = 1;
                            });
                          },
                          child: Text(
                            'Informations',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'ArcadeClassic',
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: selectedWidget(selectedScreen),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
