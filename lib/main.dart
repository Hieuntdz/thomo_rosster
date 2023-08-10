import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roster_wallpaper/splash.dart';
import 'package:roster_wallpaper/view/home.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.getTextTheme('Montserrat'),
      ),
      home: const Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
