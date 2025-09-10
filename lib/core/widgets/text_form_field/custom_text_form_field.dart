import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class FigmaInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool sifreAlani;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;

  const FigmaInputField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.sifreAlani = false,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
  });

  @override
  State<FigmaInputField> createState() => _FigmaInputFieldState();
}

class _FigmaInputFieldState extends State<FigmaInputField> {
  bool _sifreGizli = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354,
      height: 56,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.sifreAlani ? _sifreGizli : false,
        validator: widget.validator,
        onChanged: widget.onChanged,
        textInputAction: widget.textInputAction,
        style: AppTextStyles.inputText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTextStyles.inputPlaceholder,
          prefixIcon: widget.prefixIcon != null 
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: widget.prefixIcon,
                )
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 54, // 20px padding + 24px icon + 10px gap
            maxWidth: 54,
            minHeight: 24,
            maxHeight: 24,
          ),
          suffixIcon: widget.sifreAlani
              ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _sifreGizli = !_sifreGizli;
                      });
                    },
                    icon: Icon(
                      _sifreGizli ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: AppColors.textMuted, // White %30
                      size: 24,
                    ),
                  ),
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 44, // 24px icon + 20px padding
            maxWidth: 44,
            minHeight: 24,
            maxHeight: 24,
          ),
          filled: true,
          fillColor: AppColors.inputBackground, // White %5
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18), // Figma'dan
            borderSide: const BorderSide(
              color: AppColors.inputBorder, // White %20
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: AppColors.inputBorder, // White %20
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: AppColors.inputFocusedBorder, // Primary
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: AppColors.error,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: AppColors.error,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

// Geriye dönük uyumluluk için eski widget
class CustomTextFormField extends FigmaInputField {
  const CustomTextFormField({
    super.key,
    required String hintText,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    bool showPasswordToggle = false,
    Widget? prefixIcon,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    TextInputAction textInputAction = TextInputAction.done,
    // Kullanılmayan parametreler
    String? labelText,
    Widget? suffixIcon,
    void Function(String?)? onSaved,
    bool enabled = true,
    int maxLines = 1,
  }) : super(
          hintText: hintText,
          controller: controller,
          keyboardType: keyboardType,
          sifreAlani: showPasswordToggle,
          prefixIcon: prefixIcon,
          validator: validator,
          onChanged: onChanged,
          textInputAction: textInputAction,
        );
}
