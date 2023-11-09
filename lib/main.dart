import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/screens/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To - Do App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 8, 43, 71),
          primary: const Color.fromARGB(255, 8, 43, 71),
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.lato().toString(),
      ),
      debugShowCheckedModeBanner: false,
      home: const Signup(),
    );
  }
}
