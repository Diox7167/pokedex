import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const snackBarDuration = Duration(seconds: 1);

class GenericSnackBar extends SnackBar {
  GenericSnackBar({
    @required String text,
    @required Color backgroundColor,
    @required Color color,
    SnackBarAction action,
    Duration duration = snackBarDuration,
  }) : super(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.unmodifiable(() sync* {
              yield Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  )),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: color,
                      fontFamily: 'ArcadeClassic',
                    ),
                  ));
            }()),
          ),
          backgroundColor: backgroundColor,
          action: action,
          duration: duration,
          behavior: SnackBarBehavior.floating,
        );
}
