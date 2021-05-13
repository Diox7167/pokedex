import 'package:flutter/material.dart';
import 'package:pokedex/stores/pokemonStore.dart';
import 'package:pokedex/ui/widgets/pokemon/langItemWidget.dart';

class InformationsWidget extends StatefulWidget {
  final PokemonStore pokemon;
  final Color typeColor;

  const InformationsWidget({Key key, this.pokemon, this.typeColor})
      : super(key: key);

  @override
  _InformationsWidgetState createState() => _InformationsWidgetState();
}

class _InformationsWidgetState extends State<InformationsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LanguageItemWidget(
          langLabel: 'Francais',
          name: widget.pokemon.name.french,
          typeColor: widget.typeColor,
        ),
        LanguageItemWidget(
          langLabel: 'Anglais',
          name: widget.pokemon.name.english,
          typeColor: widget.typeColor,
        ),
        LanguageItemWidget(
          langLabel: 'Japonnais',
          name: widget.pokemon.name.japanese,
          typeColor: widget.typeColor,
        ),
        LanguageItemWidget(
          langLabel: 'Chinois',
          name: widget.pokemon.name.chinese,
          typeColor: widget.typeColor,
        ),
      ],
    );
  }
}
