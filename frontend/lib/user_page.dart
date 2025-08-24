import 'package:business_card_pp/card_object.dart';
import 'package:business_card_pp/constants.dart';
import 'package:business_card_pp/login_page.dart';
import 'package:business_card_pp/main.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'template_build.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var login_stat = false; // TODO: USE db authentication to verify status

  // TODO: Change to actual logged in user.
  BusinessCardModel user_data = kcardExample[3];

  // TODO: User Authentication for different layout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Implement with the user information
      body: SafeArea(
        child: login_stat
            ? Column(
                children: [k_buildTemplate(user_data, true)],
              ) // TODO: Make this a separated page
            : Row(
                // Log in require
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.account_circle_rounded, size: 200),
                      ),
                      SizedBox(height: 100),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          minimumSize: Size(300, 50),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/Login');
                        },
                        child: Text("Log In"),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        style: TextButton.styleFrom(
                          side: BorderSide(width: 0.5),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: Size(300, 50),
                        ),
                        onPressed: () {},
                        child: Text("Sign Up"),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
