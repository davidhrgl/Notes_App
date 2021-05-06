import 'package:flutter/material.dart';

Color colorConvert(String color) {
  color = color.replaceAll("#", "");
  var converted;
  if (color.length == 6) {
    converted = Color(int.parse("0xFF" + color));
  } else if (color.length == 8) {
    converted = Color(int.parse("0x" + color));
  }
  return converted;
}