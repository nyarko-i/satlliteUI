import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:satellite/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISP UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Color(0xff040505),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff040505),
          foregroundColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}
