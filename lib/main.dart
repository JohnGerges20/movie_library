
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFFFC857);
    const background = Color(0xFF121212);
    const surface = Color(0xFF1E1E1E);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Library',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: gold,
          onPrimary: background,
          secondary: gold,
          surface: surface,
          onSurface: Color(0xFFF5F5F5),
          onSurfaceVariant: Color(0xFFBDBDBD),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: background,
          foregroundColor: Color(0xFFF5F5F5),
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surface,
          hintStyle: const TextStyle(
            color: Color(0xFF9E9E9E),
          ),
          prefixIconColor: gold,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Color(0xFF383838),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: gold,
              width: 1.5,
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
