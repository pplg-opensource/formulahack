import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/ui/intro/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorValues.backgroundColor,
        textTheme: GoogleFonts.exoTextTheme(),
      ),
      home: const SplashScreen(),
    );
  }
}
