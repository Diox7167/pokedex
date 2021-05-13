import 'package:flutter/material.dart';

class StatItemWidget extends StatefulWidget {
  final dynamic stat;
  final String statName;
  final Color typeColor;

  const StatItemWidget({Key key, this.stat, this.typeColor, this.statName})
      : super(key: key);

  @override
  _StatItemWidgetState createState() => _StatItemWidgetState();
}

class _StatItemWidgetState extends State<StatItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            widget.statName,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'ArcadeClassic',
              color: widget.typeColor,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            widget.stat.toString(),
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'ArcadeClassic',
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: 300,
            height: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: widget.stat.toDouble() / 100,
                valueColor: new AlwaysStoppedAnimation<Color>(widget.typeColor),
                backgroundColor: Colors.grey.shade300,
              ),
            ),
          ),
        )
      ],
    );
  }
}
