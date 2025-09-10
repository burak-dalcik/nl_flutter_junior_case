import 'package:flutter/material.dart';
import '../../constants/app_text_styles.dart';

// şifremi unutttum butonu.

class FigmaTextButon extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  const FigmaTextButon({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: textStyle ?? AppTextStyles.sifreUnutButon,
      ),
    );
  }
}