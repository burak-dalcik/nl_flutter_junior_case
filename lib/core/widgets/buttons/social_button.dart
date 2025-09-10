import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
// Sosyal medya butonları - Figma tasarımına uygun

class FigmaSosyalButon extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const FigmaSosyalButon({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.socialButtonBackground,
          foregroundColor: AppColors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          side: const BorderSide(
            color: AppColors.socialButtonBorder,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(8),
        ),
        child: icon,
      ),
    );
  }
}
