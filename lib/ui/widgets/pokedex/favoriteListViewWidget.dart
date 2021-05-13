import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/stores/pokemonStore.dart';
import 'package:pokedex/ui/widgets/pokedex/pokemonItemWidget.dart';

class FavoriteListViewWidget extends StatefulWidget {
  final List<PokemonStore> pokemons;
  final TextEditingController searchController;
  final bool isLoading;

  const FavoriteListViewWidget(
      {Key key, this.pokemons, this.searchController, this.isLoading})
      : super(key: key);

  @override
  _FavoriteListViewWidgetState createState() => _FavoriteListViewWidgetState();
}

class _FavoriteListViewWidgetState extends State<FavoriteListViewWidget> {
  @override
  void initState() {
    super.initState();
    user.favorites.sort((a, b) => a.id.compareTo(b.id));
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
    return widget.isLoading
        ? Center(child: CircularProgressIndicator())
        : user.favorites.isEmpty
            ? Center(
                child: Text(
                  'Nous n\'avez pas de favoris',
                  style: TextStyle(
                    fontFamily: 'ArcadeClassic',
                    fontSize: 20.0,
                  ),
                ),
              )
            : ListView(
                shrinkWrap: true,
                children: [
                  for (PokemonStore pokemon in user.favorites.where((pokemon) =>
                      pokemon.name.french
                          .contains(widget.searchController.text)))
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
