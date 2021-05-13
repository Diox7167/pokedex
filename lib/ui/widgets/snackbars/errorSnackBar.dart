import 'package:flutter/material.dart';
import 'package:pokedex/ui/widgets/snackbars/genericSnackBar.dart';

class ErrorSnackBar extends GenericSnackBar {
  ErrorSnackBar({
    @required String text,
    SnackBarAction action,
    Duration duration = snackBarDuration,
  }) : super(
          text: text,
          backgroundColor: Colors.red,
          color: Colors.white,
          action: action,
          duration: duration,
        );
}
