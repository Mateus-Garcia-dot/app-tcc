import 'dart:ui';

import 'package:flutter/material.dart';

class ConversorCores {
  static Color fromString(String colorString) {
    switch (colorString) {
      case 'AMARELA':
        return Colors.yellow;
      case 'VERMELHA':
        return Colors.red;
      case 'LARANJA':
        return Colors.orange;
      case 'PRATA':
        return Colors.grey;
      case 'VERDE':
        return Colors.lightGreen;
      case 'MADRUGUEIRO':
        return Colors.black;
      case 'TURISMO':
        return Colors.green;
      default:
        throw FormatException("Cor invalida: $colorString");
    }
  }
}
