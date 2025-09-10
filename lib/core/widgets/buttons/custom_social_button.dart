import 'package:jr_case_boilerplate/core/widgets/buttons/social_button.dart';
import 'package:flutter/material.dart';

class CustomSocialButton extends FigmaSosyalButon {
  const CustomSocialButton({
    super.key,
    required Widget icon,
    VoidCallback? onPressed,
    Color? backgroundColor,
    double size = 48,
  }) : super(
    icon: icon,
    onPressed: onPressed,
  );
}
