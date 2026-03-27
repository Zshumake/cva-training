import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ─── EDITORIAL MEDICAL REFERENCE PALETTE ───
  // Deep midnight navy with warm copper accents — authoritative yet warm
  static const Color primaryNavy = Color(0xFF0F172A);
  static const Color secondaryNavy = Color(0xFF1E293B);
  static const Color accentTeal = Color(0xFF0D9488);
  static const Color accentCopper = Color(0xFFD97706);
  static const Color warningAmber = Color(0xFFF59E0B);
  static const Color dangerRed = Color(0xFFDC2626);
  static const Color successGreen = Color(0xFF059669);
  static const Color surfaceLight = Color(0xFFF1F5F9);
  static const Color surfaceWarm = Color(0xFFFAF9F7);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color borderSubtle = Color(0xFFE2E8F0);

  // ─── MID-TONE GRAYS ───
  static const Color gray100 = Color(0xFFF8FAFC);
  static const Color gray200 = Color(0xFFE2E8F0);
  static const Color gray250 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFCBD5E1);
  static const Color gray400 = Color(0xFF94A3B8);
  static const Color gray500 = Color(0xFF64748B);

  // Module-specific colors — deeper, more saturated
  static const Color fundamentalsColor = Color(0xFF2563EB);
  static const Color vascularColor = Color(0xFF7C3AED);
  static const Color ischemicColor = Color(0xFF0284C7);
  static const Color syndromesColor = Color(0xFF4F46E5);
  static const Color hemorrhagicColor = Color(0xFFB91C1C);
  static const Color diagnosticColor = Color(0xFF6D28D9);
  static const Color acuteColor = Color(0xFFC2410C);
  static const Color pharmacologyColor = Color(0xFF0F766E);
  static const Color motorRecoveryColor = Color(0xFFBE123C);
  static const Color spasticityColor = Color(0xFF1D4ED8);
  static const Color dysphagiaColor = Color(0xFF7E22CE);
  static const Color cognitionColor = Color(0xFF047857);
  static const Color complicationsColor = Color(0xFFEA580C);
  static const Color outcomesColor = Color(0xFF0E7490);

  // Pearl / special block colors
  static const Color pearlBackground = Color(0xFFFFFBEB);
  static const Color pearlBorder = Color(0xFFD97706);
  static const Color mnemonicBackground = Color(0xFFF5F3FF);
  static const Color mnemonicBorder = Color(0xFF6D28D9);
  static const Color avoidBackground = Color(0xFFFEF2F2);
  static const Color avoidBorder = Color(0xFFDC2626);

  // Glass / frosted surface
  static const Color glassSurface = Color(0xCCFFFFFF);
  static const Color glassStroke = Color(0x33FFFFFF);

  // ─── SPACING SYSTEM ───
  static const double spacingXS = 4;
  static const double spacingSM = 8;
  static const double spacingMD = 16;
  static const double spacingLG = 24;
  static const double spacingXL = 32;
  static const double spacingXXL = 48;

  // ─── BORDER RADIUS SYSTEM ───
  static const double radiusSM = 8;
  static const double radiusMD = 12;
  static const double radiusLG = 16;
  static const double radiusXL = 20;

  // ─── SHADOW SYSTEM ───
  static List<BoxShadow> get shadowSubtle => [
        BoxShadow(
          color: const Color(0x08000000),
          blurRadius: 4,
          offset: const Offset(0, 1),
        ),
      ];

  static List<BoxShadow> get shadowCard => [
        BoxShadow(
          color: const Color(0x08000000),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get shadowElevated => [
        BoxShadow(
          color: const Color(0x0F000000),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: const Color(0x08000000),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ];

  // ─── ANIMATION TIMING ───
  static const Duration durationMicro = Duration(milliseconds: 50);
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);

  // ─── SEMANTIC TEXT STYLES ───

  /// Board Pearl callout text -- copper italic with emphasis
  static TextStyle boardPearlStyle() => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
        color: const Color(0xFF92400E),
        height: 1.5,
      );

  /// Medication dosing text -- monospaced for clarity
  static TextStyle dosingStyle() => GoogleFonts.jetBrainsMono(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: textPrimary,
        height: 1.5,
        letterSpacing: -0.2,
      );

  /// Scale / assessment tool header
  static TextStyle scaleHeaderStyle() => GoogleFonts.sourceSerif4(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: primaryNavy,
        letterSpacing: -0.3,
        height: 1.2,
      );

  static ThemeData get lightTheme {
    final displayFont = GoogleFonts.sourceSerif4();
    final bodyFont = GoogleFonts.inter();

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryNavy,
        brightness: Brightness.light,
        primary: primaryNavy,
        secondary: accentTeal,
        tertiary: accentCopper,
        surface: surfaceWarm,
      ),
      scaffoldBackgroundColor: surfaceWarm,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryNavy,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: -0.3,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLG),
          side: const BorderSide(color: borderSubtle, width: 1),
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: displayFont.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: textPrimary,
          letterSpacing: -1.2,
          height: 1.1,
        ),
        headlineMedium: displayFont.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: -0.8,
        ),
        titleLarge: bodyFont.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: -0.3,
        ),
        titleMedium: bodyFont.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: -0.2,
        ),
        titleSmall: bodyFont.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: -0.2,
        ),
        bodyLarge: bodyFont.copyWith(
          fontSize: 15,
          height: 1.7,
          color: textPrimary,
          letterSpacing: -0.1,
        ),
        bodyMedium: bodyFont.copyWith(
          fontSize: 13,
          height: 1.6,
          color: textSecondary,
          letterSpacing: 0,
        ),
        labelLarge: bodyFont.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
        labelSmall: bodyFont.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
          color: textSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentTeal,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMD),
          ),
          textStyle: bodyFont.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.1,
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: borderSubtle,
        thickness: 1,
        space: 1,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
