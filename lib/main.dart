import 'package:flutter/material.dart';
import 'package:formulahack/ui/intro/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: GoogleFonts.exoTextTheme()),
      home: SplashScreen(),
    );
  }
}
