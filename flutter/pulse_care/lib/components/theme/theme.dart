import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class AppTheme {
  const AppTheme();

  static ColorScheme _lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff36693d),
      surfaceTint: Color(0xff36693d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb8f1b9),
      onPrimaryContainer: Color(0xff002108),
      secondary: Color(0xff516350),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd4e8d1),
      onSecondaryContainer: Color(0xff0f1f11),
      tertiary: Color(0xff39656c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbdeaf3),
      onTertiaryContainer: Color(0xff001f24),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff7fbf2),
      onSurface: Color(0xff181d18),
      onSurfaceVariant: Color(0xff424940),
      outline: Color(0xff727970),
      outlineVariant: Color(0xffc1c9be),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff9cd49f),
      primaryFixed: Color(0xffb8f1b9),
      onPrimaryFixed: Color(0xff002108),
      primaryFixedDim: Color(0xff9cd49f),
      onPrimaryFixedVariant: Color(0xff1e5128),
      secondaryFixed: Color(0xffd4e8d1),
      onSecondaryFixed: Color(0xff0f1f11),
      secondaryFixedDim: Color(0xffb8ccb5),
      onSecondaryFixedVariant: Color(0xff3a4b3a),
      tertiaryFixed: Color(0xffbdeaf3),
      onTertiaryFixed: Color(0xff001f24),
      tertiaryFixedDim: Color(0xffa1ced6),
      onTertiaryFixedVariant: Color(0xff1f4d54),
      surfaceDim: Color(0xffd7dbd3),
      surfaceBright: Color(0xfff7fbf2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f5ec),
      surfaceContainer: Color(0xffebefe7),
      surfaceContainerHigh: Color(0xffe5e9e1),
      surfaceContainerHighest: Color(0xffe0e4db),
    );
  }

  ThemeData light() {
    return _theme(_lightScheme());
  }

  static ColorScheme _darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9cd49f),
      surfaceTint: Color(0xff9cd49f),
      onPrimary: Color(0xff013913),
      primaryContainer: Color(0xff1e5128),
      onPrimaryContainer: Color(0xffb8f1b9),
      secondary: Color(0xffb8ccb5),
      onSecondary: Color(0xff243424),
      secondaryContainer: Color(0xff3a4b3a),
      onSecondaryContainer: Color(0xffd4e8d1),
      tertiary: Color(0xffa1ced6),
      onTertiary: Color(0xff00363d),
      tertiaryContainer: Color(0xff1f4d54),
      onTertiaryContainer: Color(0xffbdeaf3),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101510),
      onSurface: Color(0xffe0e4db),
      onSurfaceVariant: Color(0xffc1c9be),
      outline: Color(0xff8b9389),
      outlineVariant: Color(0xff424940),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4db),
      inversePrimary: Color(0xff36693d),
      primaryFixed: Color(0xffb8f1b9),
      onPrimaryFixed: Color(0xff002108),
      primaryFixedDim: Color(0xff9cd49f),
      onPrimaryFixedVariant: Color(0xff1e5128),
      secondaryFixed: Color(0xffd4e8d1),
      onSecondaryFixed: Color(0xff0f1f11),
      secondaryFixedDim: Color(0xffb8ccb5),
      onSecondaryFixedVariant: Color(0xff3a4b3a),
      tertiaryFixed: Color(0xffbdeaf3),
      onTertiaryFixed: Color(0xff001f24),
      tertiaryFixedDim: Color(0xffa1ced6),
      onTertiaryFixedVariant: Color(0xff1f4d54),
      surfaceDim: Color(0xff101510),
      surfaceBright: Color(0xff363a35),
      surfaceContainerLowest: Color(0xff0b0f0b),
      surfaceContainerLow: Color(0xff181d18),
      surfaceContainer: Color(0xff1c211c),
      surfaceContainerHigh: Color(0xff272b26),
      surfaceContainerHighest: Color(0xff313630),
    );
  }

  ThemeData dark() {
    return _theme(_darkScheme());
  }

  static TextTheme get _textTheme => TextTheme(
        displayLarge: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
        ),
        titleMedium: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
        ),
        titleSmall: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.lato(
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: GoogleFonts.lato(
          fontWeight: FontWeight.normal,
        ),
        bodySmall: GoogleFonts.lato(
          fontWeight: FontWeight.normal,
        ),
        labelLarge: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
        ),
        labelMedium: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
        ),
        labelSmall: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
        ),
      );

  static const _inputDecorationTheme =
      InputDecorationTheme(border: OutlineInputBorder());

  ThemeData _theme(ColorScheme colorScheme) => ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: _textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      inputDecorationTheme: _inputDecorationTheme);
}
