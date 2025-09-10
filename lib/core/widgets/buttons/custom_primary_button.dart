import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

// Primary login button - Figma design compliant
class FigmaPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const FigmaPrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary, // #E50914
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // From Figma
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8), // From Figma
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : Text(
                text,
                style: AppTextStyles.anaButonText,
              ),
      ),
    );
  }
}

// Social media buttons - Figma design compliant
class FigmaSocialButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const FigmaSocialButton({
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
          backgroundColor: AppColors.socialButtonBackground, // White %5
          foregroundColor: AppColors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          side: const BorderSide(
            color: AppColors.socialButtonBorder, // White %20
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // From Figma
          ),
          padding: const EdgeInsets.all(8), // From Figma
        ),
        child: icon,
      ),
    );
  }
}

// Text button - Figma design compliant
class FigmaTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  const FigmaTextButton({
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

// Backward compatibility - old button classes
class CustomPrimaryButton extends FigmaPrimaryButton {
  const CustomPrimaryButton({
    super.key,
    required String text,
    VoidCallback? onPressed,
    bool isLoading = false,
    // Unused parameters for backward compatibility
    bool isEnabled = true,
    double? width,
    double height = 56,
    Widget? icon,
    Color? backgroundColor,
    Color? textColor,
    double borderRadius = 8,
  }) : super(
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
        );
}

class CustomSocialButton extends FigmaSocialButton {
  const CustomSocialButton({
    super.key,
    required Widget icon,
    VoidCallback? onPressed,
    // Unused parameters for backward compatibility
    Color? backgroundColor,
    double size = 48,
  }) : super(
          icon: icon,
          onPressed: onPressed,
        );
}

// Legacy aliases - will be deprecated
typedef FigmaAnaButon = FigmaPrimaryButton;
typedef FigmaSosyalButon = FigmaSocialButton;
typedef FigmaTextButon = FigmaTextButton;