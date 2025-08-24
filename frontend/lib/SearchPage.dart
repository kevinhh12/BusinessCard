import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // TODO: Finish the search bar
            // TODO: Result after search
            // TODO: Add card for user
            TextField(controller: _controller),
            Expanded(
              child: ListView(children: results.map((e) => Text(e)).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
