import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 40),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home'); // 举例
                },
                child: const Text("Log In"),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(color: Colors.black, height: 36),
                    ),
                  ),
                  Text("OR"),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Divider(color: Colors.black, height: 36),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/icons8-google-logo-48.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10),

                    Text('Sign up with Google', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
