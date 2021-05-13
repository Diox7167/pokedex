import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:pokedex/stores/pokemonStore.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'userStore.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  String pseudo;
  List<PokemonStore> favorites = [];

  @action
  Future<bool> setPseudo(String pseudo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('pseudo', pseudo);
    this.pseudo = pseudo;
    return true;
  }

  @action
  Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    this.pseudo = '';
    this.favorites = [];
    return true;
  }

  @action
  Future<bool> addFavorite(PokemonStore pokemon) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var contain = this.favorites.where((element) => element.id == pokemon.id);
    if (contain.isEmpty) {
      this.favorites.add(pokemon);
    }

    /*if (!this.favorites.contains(pokemon)) {
      this.favorites.add(pokemon);
    }*/
    await prefs.setString("favorites", jsonEncode(this.favorites));

    return true;
  }

  @action
  Future<bool> removeFavorite(PokemonStore pokemon) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var contain = this.favorites.where((element) => element.id == pokemon.id);
    if (contain.isNotEmpty) {
      this.favorites.removeWhere((element) => element.id == pokemon.id);
    }

    /*if (this.favorites.contains(pokemon)) {
      this.favorites.remove(pokemon);
    }*/
    await prefs.setString("favorites", jsonEncode(this.favorites));

    return true;
  }

  @action
  Future<List<PokemonStore>> getFavorites() async {
    this.favorites = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('favorites') != null) {
      List myMap = jsonDecode(prefs.getString('favorites'));

      for (var pokemon in myMap) {
        if (!this.favorites.contains(pokemon)) {
          this.favorites.add(PokemonStore.fromJson(pokemon));
        }
      }
    }

    return favorites;
  }
}
