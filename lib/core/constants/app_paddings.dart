import 'package:flutter/material.dart';

class AppPaddings {
  AppPaddings._();

  // General Paddings
  static const EdgeInsets zero = EdgeInsets.zero;
  static const EdgeInsets small = EdgeInsets.all(8.0);
  static const EdgeInsets medium = EdgeInsets.all(16.0);
  static const EdgeInsets large = EdgeInsets.all(24.0);
  static const EdgeInsets extraLarge = EdgeInsets.all(32.0);

  // Horizontal Paddings
  static const EdgeInsets horizontalSmall = EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets horizontalMedium = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets horizontalLarge = EdgeInsets.symmetric(horizontal: 24.0);
  static const EdgeInsets horizontalExtraLarge = EdgeInsets.symmetric(horizontal: 32.0);

  // Vertical Paddings
  static const EdgeInsets verticalSmall = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets verticalMedium = EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsets verticalLarge = EdgeInsets.symmetric(vertical: 24.0);
  static const EdgeInsets verticalExtraLarge = EdgeInsets.symmetric(vertical: 32.0);

  // Specific Paddings
  static const EdgeInsets pageHorizontal = EdgeInsets.symmetric(horizontal: 24.0);
  static const EdgeInsets pageVertical = EdgeInsets.symmetric(vertical: 32.0);
  static const EdgeInsets page = EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0);
  
  // Input Field Paddings
  static const EdgeInsets inputField = EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0);
  static const EdgeInsets inputFieldSmall = EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0);
  
  // Button Paddings
  static const EdgeInsets button = EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0);
  static const EdgeInsets buttonSmall = EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
}
