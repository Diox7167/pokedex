import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:pokedex/models/nameModel.dart';
import 'package:pokedex/models/baseModel.dart';
import 'package:diacritic/diacritic.dart';

part 'pokemonStore.g.dart';

class PokemonStore = _PokemonStore with _$PokemonStore;

abstract class _PokemonStore with Store {
  int id;
  NameModel name;
  List<dynamic> types;
  BaseModel base;

  _PokemonStore.fromJson(Map<String, dynamic> jsonMap) {
    this.id = jsonMap['id'];
    this.name = NameModel(
        removeDiacritics(jsonMap['name']['english']).toLowerCase(),
        removeDiacritics(jsonMap['name']['japanese']).toLowerCase(),
        removeDiacritics(jsonMap['name']['chinese']).toLowerCase(),
        removeDiacritics(jsonMap['name']['french']).toLowerCase());
    this.types = jsonMap['type'];
    this.base = BaseModel(
        jsonMap['base']['HP'],
        jsonMap['base']['Attack'],
        jsonMap['base']['Defense'],
        jsonMap['base']['Sp. Attack'],
        jsonMap['base']['Sp. Defense'],
        jsonMap['base']['Speed']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name':
            NameModel(name.english, name.japanese, name.chinese, name.french),
        'type': types,
        'base': BaseModel(base.hp, base.attack, base.defense, base.spAttack,
            base.spDefense, base.speed),
      };

  @override
  String toString() {
    return jsonEncode(this.toJson());
  }
}
