import 'package:flutter/material.dart';
import 'package:pokedex/stores/pokemonStore.dart';
import 'package:pokedex/ui/widgets/pokemon/statItemWidget.dart';

class StatsWidget extends StatefulWidget {
  final PokemonStore pokemon;
  final Color typeColor;

  const StatsWidget({Key key, this.pokemon, this.typeColor}) : super(key: key);

  @override
  _StatsWidgetState createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<StatsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatItemWidget(
          statName: 'HP',
          stat: widget.pokemon.base.hp,
          typeColor: widget.typeColor,
        ),
        StatItemWidget(
          statName: 'Att',
          stat: widget.pokemon.base.attack,
          typeColor: widget.typeColor,
        ),
        StatItemWidget(
          statName: 'Def',
          stat: widget.pokemon.base.defense,
          typeColor: widget.typeColor,
        ),
        StatItemWidget(
          statName: 'Sp. Att',
          stat: widget.pokemon.base.spAttack,
          typeColor: widget.typeColor,
        ),
        StatItemWidget(
          statName: 'Sp. Def',
          stat: widget.pokemon.base.spDefense,
          typeColor: widget.typeColor,
        ),
        StatItemWidget(
          statName: 'Speed',
          stat: widget.pokemon.base.speed,
          typeColor: widget.typeColor,
        ),
      ],
    );
  }
}
