import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Figma'dan alınan font stilleri - Instrument Sans
  
  // Başlık stilleri
  static const TextStyle girisYapBaslik = TextStyle(
    fontFamily: 'Instrument Sans',
    fontSize: 24,
    fontWeight: FontWeight.w700, // Bold
    height: 29 / 24, // line-height/font-size
    color: AppColors.textPrimary,
  );

  static const TextStyle kayitOlBaslik = TextStyle(
    fontFamily: 'Instrument Sans',
    fontSize: 24,
    fontWeight: FontWeight.w700, // Bold
    height: 29 / 24, // line-height/font-size
    color: AppColors.textPrimary,
  );

  static const TextStyle altBaslik = TextStyle(
    fontFamily: 'Instrument Sans',
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    height: 17 / 14, // line-height/font-size
    color: AppColors.textSecondary, // White %90
  );

  // Input field stilleri
  static const TextStyle inputPlaceholder = TextStyle(
    fontFamily: 'Instrument Sans',
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    height: 17 / 14,
    color: AppColors.textHint, // White %50
  );

  static const TextStyle inputText = TextStyle(
    fontFamily: 'Instrument Sans',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 17 / 14,
    color: AppColors.textPrimary,
  );

  // Buton stilleri
  static const TextStyle anaButonText = TextStyle(
    fontFamily: 'Instrument Sans',
    fontSize: 16,
    fontWeight: FontWeight.w600, // Semibold
    height: 20 / 16,
    color: AppColors.white,
  );

  static const TextStyle sifreUnutButon = TextStyle(
    fontFamily: 'Instrument Sans',
    fontSize: 14,
    fontWeight: FontWeight.w600, // Semibold
    height: 17 / 14,
    color: AppColors.white,
  );

  // Alt kısım text stilleri
  static const TextStyle hesabinYokMu = TextStyle(
    fontFamily: 'Instrument Sans',
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    height: 17 / 14,
    color: AppColors.textTertiary, // White %80
  );

  static const TextStyle kayitOlButon = TextStyle(
    fontFamily: 'Instrument Sans',
    fontSize: 14,
    fontWeight: FontWeight.w600, // Semibold
    height: 17 / 14,
    color: AppColors.white,
  );

  // Terms and conditions text styles
  static const TextStyle termsText = TextStyle(
    fontFamily: 'Instrument Sans',
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    height: 17 / 14,
    color: AppColors.textPrimary,
  );

  static const TextStyle termsLink = TextStyle(
    fontFamily: 'Instrument Sans',
    fontSize: 14,
    fontWeight: FontWeight.w700, // Bold
    height: 17 / 14,
    color: AppColors.white,
    decoration: TextDecoration.underline,
  );

  // Genel stiller (geriye dönük uyumluluk için)
  static const TextStyle heading2 = girisYapBaslik;
  static const TextStyle bodyMedium = altBaslik;
  static const TextStyle buttonLarge = anaButonText;
  static const TextStyle link = sifreUnutButon;
  static const TextStyle inputHint = inputPlaceholder;
}
