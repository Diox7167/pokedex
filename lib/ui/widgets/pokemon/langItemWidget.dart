import 'package:flutter/material.dart';

class LanguageItemWidget extends StatefulWidget {
  final String langLabel;
  final String name;
  final Color typeColor;

  const LanguageItemWidget({Key key, this.name, this.typeColor, this.langLabel})
      : super(key: key);

  @override
  _LanguageItemWidgetState createState() => _LanguageItemWidgetState();
}

class _LanguageItemWidgetState extends State<LanguageItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              widget.langLabel,
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'ArcadeClassic',
                color: widget.typeColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'ArcadeClassic',
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
