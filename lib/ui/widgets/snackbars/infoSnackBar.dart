import 'package:flutter/material.dart';
import 'package:pokedex/ui/widgets/snackbars/genericSnackBar.dart';

class InfoSnackBar extends GenericSnackBar {
  InfoSnackBar({
    @required String text,
    SnackBarAction action,
    Duration duration = snackBarDuration,
  }) : super(
          text: text,
          backgroundColor: Colors.grey.shade400,
          color: Colors.black,
          action: action,
          duration: duration,
        );
}
