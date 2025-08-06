import 'package:business_card_pp/HomePage.dart';
import 'package:business_card_pp/CardTemplate_1.dart';
import 'package:business_card_pp/navigationBar.dart';
import 'package:flutter/material.dart';

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
    Text('Index 1: Business', style: _optionStyle),
    Text('Index 2: School', style: _optionStyle),
    Text('Index 3: Settings', style: _optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BusineesCardi')),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BNavigationBar(
        widgetOptions: _widgetOptions,
        onTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
