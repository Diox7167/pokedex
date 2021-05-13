import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/stores/pokemonStore.dart';
import 'package:pokedex/ui/widgets/pokedex/pokemonItemWidget.dart';
import 'package:diacritic/diacritic.dart';

class PokemonListViewWidget extends StatefulWidget {
  final List<PokemonStore> pokemons;
  final TextEditingController searchController;
  final bool isLoading;

  const PokemonListViewWidget(
      {Key key, this.pokemons, this.searchController, this.isLoading})
      : super(key: key);

  @override
  _PokemonListViewWidgetState createState() => _PokemonListViewWidgetState();
}

class _PokemonListViewWidgetState extends State<PokemonListViewWidget> {
  bool favorite = false;

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
    return widget.isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView(
            shrinkWrap: true,
            children: [
              for (PokemonStore pokemon in widget.pokemons.where((pokemon) =>
                  pokemon.name.french.contains(
                      removeDiacritics(widget.searchController.text))))
                PokemonItemWidget(
                  index: pokemon.id - 1,
                  pokemon: pokemon,
                  isFavorite: isFavorite(pokemon),
                  refreshFavorites: () {
                    setState(() {});
                  },
                )
            ],
          );
  }
}
