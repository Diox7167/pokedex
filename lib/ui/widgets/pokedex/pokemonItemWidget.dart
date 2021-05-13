import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/stores/pokemonStore.dart';
import 'package:pokedex/ui/views/pokemonScreen.dart';
import 'package:diacritic/diacritic.dart';

class PokemonItemWidget extends StatefulWidget {
  final PokemonStore pokemon;
  final int index;
  final bool isFavorite;
  final Function refreshFavorites;

  const PokemonItemWidget(
      {Key key,
      this.pokemon,
      this.index,
      this.isFavorite,
      this.refreshFavorites})
      : super(key: key);

  @override
  _PokemonItemWidgetState createState() => _PokemonItemWidgetState();
}

class _PokemonItemWidgetState extends State<PokemonItemWidget> {
  Color typeColor(List<dynamic> types) {
    if (types.contains('Grass')) {
      return Colors.green;
    } else if (types.contains('Fire')) {
      return Colors.orange;
    } else if (types.contains('Poison')) {
      return Colors.purple;
    } else if (types.contains('Electric')) {
      return Colors.yellow.shade700;
    } else if (types.contains('Water')) {
      return Colors.lightBlue;
    } else if (types.contains('Bug')) {
      return Colors.lightGreen;
    } else if (types.contains('Flying')) {
      return Colors.lightBlue.shade200;
    } else if (types.contains('Normal')) {
      return Colors.grey;
    } else if (types.contains('Ground')) {
      return Colors.deepOrange;
    } else if (types.contains('Fairy')) {
      return Colors.pinkAccent;
    } else if (types.contains('Fighting')) {
      return Colors.red;
    } else if (types.contains('Psychic')) {
      return Colors.purpleAccent;
    } else if (types.contains('Dragon')) {
      return Colors.blue;
    } else if (types.contains('Ghost')) {
      return Colors.deepPurpleAccent;
    } else if (types.contains('Ice')) {
      return Colors.teal;
    } else if (types.contains('Rock')) {
      return Colors.blue;
    } else if (types.contains('Steel')) {
      return Colors.blueGrey;
    } else {
      return Colors.white;
    }
  }

  bool isFavorite(PokemonStore pokemon) {
    var liked = user.favorites.where((element) => element.id == pokemon.id);
    if (liked.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonScreen(
              pokemon: widget.pokemon,
              typeColor: typeColor(widget.pokemon.types),
              isFavorite: isFavorite(widget.pokemon),
              newFavorite: (v) {
                widget.refreshFavorites();
              },
            ),
          ),
        ).then((value) {
          widget.refreshFavorites();
        });
      },
      child: ListTile(
        leading: Image(
          width: 100,
          image:
              AssetImage('assets/images/pokemon_icon/${widget.index + 1}.png'),
        ),
        title: Text(
          removeDiacritics(
              '#${widget.pokemon.id} - ${widget.pokemon.name.french}'),
          style: TextStyle(
            fontFamily: 'ArcadeClassic',
          ),
        ),
        subtitle: Row(
          children: [
            for (final dynamic type in widget.pokemon.types)
              Image(
                width: 20.0,
                image: AssetImage('assets/images/types/${type.toString()}.png'),
              )
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            widget.isFavorite == true ? Icons.favorite : Icons.favorite_border,
            color: widget.isFavorite == true ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            if (widget.isFavorite != true) {
              setState(() {
                user.addFavorite(widget.pokemon);
              });
            } else {
              setState(() {
                user.removeFavorite(widget.pokemon);
              });
            }
            widget.refreshFavorites();
          },
        ),
      ),
    );
  }
}
