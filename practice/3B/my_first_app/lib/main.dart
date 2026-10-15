import 'package:flutter/material.dart';
import 'package:my_first_app/pages/home_page.dart';
import 'package:my_first_app/pages/login_page.dart';
import 'package:my_first_app/pages/register_page.dart';

void main() {
  runApp(AplikasiUtama());
}

class AplikasiUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First App',
      home: LoginPage(),
    );
  }
}
