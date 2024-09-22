import 'package:flutter/material.dart';

/// Le theme défaut pour l'application.
///
/// Ce theme utilise Material 3, un schéma de couleurs personnalisé,
/// et la font style "Lato". Il définit aussi divers styles
/// de texte
final ThemeData defaultTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 51, 62, 100),
      primary: const Color.fromARGB(255, 51, 62, 100),
      secondary: const Color.fromARGB(255, 79, 109, 177),
      tertiary: const Color.fromARGB(255, 88, 138, 226),
      surface: const Color.fromARGB(255, 245, 244, 245),
      onSurface: const Color.fromARGB(255, 62, 59, 62)),
  fontFamily: "Lato",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
    ),
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    labelLarge: TextStyle(
      fontSize: 20,
    ),
    labelMedium: TextStyle(
      fontSize: 18,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),
);
