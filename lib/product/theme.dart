import 'package:flutter/material.dart';
import 'package:flutter_cubit_bloc/product/colors.dart';
import 'package:google_fonts/google_fonts.dart';

var theme = ThemeData(
  primaryColor: primaryColor,
  buttonTheme: const ButtonThemeData(buttonColor: primaryColor),
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle: GoogleFonts.montserrat(fontSize: 20),
  ),
  textTheme: GoogleFonts.montserratTextTheme(),
  primaryColorDark: const Color(0xFF0097A7),
  primaryColorLight: const Color(0xFFB2EBF2),
  colorScheme: const ColorScheme.light(secondary: Color(0xFF009688)),
  scaffoldBackgroundColor: const Color(0xFFE0F2F1),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
