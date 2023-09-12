import 'package:flutter/material.dart';

final customColor = CustomColor();

class CustomColor {
  Color nero = Color(0xff000000);
  Color bianco = Color(0xffffffff);

  // ARANCIONE
  Color arancione = Color(0xFFF36F21);
  Color arancioneChiaro = Color(0xFFFDEEE9);

  // DIVIDER
  Color divider = Colors.black12;

  // CAMPO LOCKED
  Color lockedBg = Color(0xFFe5e7eb); // Colors.grey.shade200;
  Color lockedBorder = Colors.grey.shade600;
  Color lockedLabel = Colors.grey.shade800;
  Color lockedText = Color(0xff000000);

  // GRIGI PER LE CARD
  Color backgground1 = Colors.grey.shade100;
}
