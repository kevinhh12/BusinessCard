import 'package:business_card_pp/CardTemplate_1.dart';
import 'package:business_card_pp/CardTemplate_2.dart';
import 'package:business_card_pp/CardTemplate_3.dart';
import 'package:business_card_pp/constants.dart';
import 'card_object.dart';
import 'package:flutter/material.dart';
import 'template_build.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  // The fetched card
  // TODO: Use database
  final List<BusinessCardModel> cards = kcardExample;
  int? selectedIndex;

  // chose template

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = isSelected ? null : index; // toggle selection
            });
          },
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastEaseInToSlowEaseOut,
            alignment: Alignment.topCenter,
            heightFactor:
                index ==
                    cards.length -
                        1 // height factor logic for last card and clicking
                ? 1
                : isSelected
                ? 1
                : 0.55,
            child: k_buildTemplate(cards[index], false),
          ),
        );
      },
    );
  }
}
