import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/stores/pokemonStore.dart';

part 'pokedexStore.g.dart';

class PokedexStore = _PokedexStore with _$PokedexStore;

abstract class _PokedexStore with Store {
  List<PokemonStore> pokemons;

  Future<bool> getPokemons() async {
    this.pokemons = [];

    final String response =
        await rootBundle.loadString('assets/data/pokemon.json');
    final List responseJson = json.decode(response);
    print(responseJson);

    for (int i = 0; i < responseJson.length; i++) {
      this.pokemons.add(PokemonStore.fromJson(responseJson[i]));
    }
    return true;
  }
}
