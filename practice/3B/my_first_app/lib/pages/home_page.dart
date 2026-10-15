import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Halo selamat datang di aplikasi utama'),
      ),
    );
  }
}
