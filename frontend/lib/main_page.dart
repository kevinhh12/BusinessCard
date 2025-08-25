import 'dart:ui';

import 'package:business_card_pp/home_page.dart';
import 'package:business_card_pp/navigationBar.dart';
import 'package:business_card_pp/user_page.dart';
import 'package:flutter/material.dart';

import 'SearchPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle _optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    SearchPage(),
    UserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 👈 allow content under the AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Glass blur
            child: AppBar(
              backgroundColor: Colors.white.withOpacity(
                0.3,
              ), // Semi-transparent
              elevation: 0,
              title: const Text('BusinessCardi'),
              centerTitle: true,
            ),
          ),
        ),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BNavigationBar(
        widgetOptions: _widgetOptions,
        onTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
