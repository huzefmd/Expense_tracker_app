import 'package:flutter/material.dart';
import 'package:tracker/expenses.dart';

var kDarkColorScheme = ColorScheme.fromSeed(seedColor: Colors.white);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          foregroundColor: const Color.fromARGB(255, 248, 248, 248),
        ),
        cardTheme: CardThemeData().copyWith(
          color: const Color.fromARGB(255, 255, 255, 255),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            foregroundColor: const Color.fromARGB(255, 248, 248, 248),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),

        textTheme: TextTheme().copyWith(
          titleLarge: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          bodyLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          bodyMedium: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,

            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      home: Expenses(),
    );
  }
}
