import 'package:flutter/material.dart';
import 'package:pokedex/ui/widgets/snackbars/genericSnackBar.dart';

class SuccessSnackBar extends GenericSnackBar {
  SuccessSnackBar({
    @required String text,
    SnackBarAction action,
    Duration duration = snackBarDuration,
  }) : super(
          text: text,
          backgroundColor: Colors.green,
          color: Colors.white,
          action: action,
          duration: duration,
        );
}
