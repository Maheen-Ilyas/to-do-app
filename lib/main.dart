import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/screens/authentication.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          seedColor: const Color.fromARGB(255, 1, 56, 101),
          primary: const Color.fromARGB(255, 1, 56, 101),
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.lato().toString(),
      ),
      debugShowCheckedModeBanner: false,
      home: const Signup(),
    );
  }
}
