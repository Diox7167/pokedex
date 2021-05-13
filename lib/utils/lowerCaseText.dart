import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LowerCaseText extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue textOld, TextEditingValue textNew) {
    return textNew.copyWith(text: textNew.text.toLowerCase());
  }
}
