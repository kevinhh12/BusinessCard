import 'package:business_card_pp/CardTemplate_1.dart';
import 'package:business_card_pp/constants.dart';
import 'card_object.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  final List<BusinessCardModel> cards = kcardExample;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              // toggle selection
              selectedIndex = isSelected ? null : index;
            });
          },
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastEaseInToSlowEaseOut,
            alignment: Alignment.topCenter,
            heightFactor: index == cards.length - 1
                ? 1
                : isSelected
                ? 1
                : 0.6,
            child: CardTemplate_1(data: cards[index]),
          ),
        );
      },
    );
  }
}
