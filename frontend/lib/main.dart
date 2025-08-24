import 'package:business_card_pp/login_page.dart';
import 'package:flutter/material.dart';
import 'package:business_card_pp/main_page.dart';

void main() {
  runApp(BusinessCard());
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => (MainPage()),
        '/Login': (context) => (LoginPage()),
      },
    );
  }
}
