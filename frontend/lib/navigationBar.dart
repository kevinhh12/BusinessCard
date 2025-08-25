import 'package:business_card_pp/constants.dart';
import 'package:flutter/material.dart';

class BNavigationBar extends StatefulWidget {
  const BNavigationBar({
    super.key,
    required this.widgetOptions,
    required this.onTapped,
    required this.selectedIndex,
  });

  final List<Widget> widgetOptions;
  final Function onTapped;
  final int selectedIndex;

  @override
  State<BNavigationBar> createState() => _BNavigationBarState();
}

class _BNavigationBarState extends State<BNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      unselectedIconTheme: IconThemeData(color: Colors.grey),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          backgroundColor: knavBarItemBackgroundColor,
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          backgroundColor: knavBarItemBackgroundColor,
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          backgroundColor: knavBarItemBackgroundColor,
          label: 'User',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.black,
      onTap: (index) => widget.onTapped(index),
    );
  }
}
