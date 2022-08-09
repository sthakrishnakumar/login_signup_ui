import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup_ui/auth/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Color(0xff0074B7),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 16,
          ),
          backgroundColor: const Color(0xff003B73),
        ),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Color(0xff0074B7)),
      ),
      home: const LoginPage(),
    );
  }
}
