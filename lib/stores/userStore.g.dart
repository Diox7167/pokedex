// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$setPseudoAsyncAction = AsyncAction('_UserStore.setPseudo');

  @override
  Future<bool> setPseudo(String pseudo) {
    return _$setPseudoAsyncAction.run(() => super.setPseudo(pseudo));
  }

  final _$logOutAsyncAction = AsyncAction('_UserStore.logOut');

  @override
  Future<bool> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  final _$addFavoriteAsyncAction = AsyncAction('_UserStore.addFavorite');

  @override
  Future<bool> addFavorite(PokemonStore pokemon) {
    return _$addFavoriteAsyncAction.run(() => super.addFavorite(pokemon));
  }

  final _$removeFavoriteAsyncAction = AsyncAction('_UserStore.removeFavorite');

  @override
  Future<bool> removeFavorite(PokemonStore pokemon) {
    return _$removeFavoriteAsyncAction.run(() => super.removeFavorite(pokemon));
  }

  final _$getFavoritesAsyncAction = AsyncAction('_UserStore.getFavorites');

  @override
  Future<List<PokemonStore>> getFavorites() {
    return _$getFavoritesAsyncAction.run(() => super.getFavorites());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
