import 'package:flutter/material.dart';
import 'package:multipage_app/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, size: 100),
              Text("Welcome to our home", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
