import 'package:flutter/material.dart';
import 'package:multipage_app/home_page.dart';
import 'package:multipage_app/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  void handleLogin() {
    var email = emailCtrl.text;
    var password = passwordCtrl.text;

    debugPrint(email);
    debugPrint(password);

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("email atau password wajib diisi")),
      );
    }

    if (email == "admin@mail.com" && password == "admin") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Login Gagal")));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                //text judul
                Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                SizedBox(height: 8),
                //texs desc
                Text(
                  "Welcome back!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                //field email
                SizedBox(height: 50),
                TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                //field password
                SizedBox(height: 16),
                TextField(
                  controller: passwordCtrl,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                //teks forgot password
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                //login button
                ElevatedButton(
                  onPressed: () => handleLogin(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text("login", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    ),
                  },
                  child: Text(
                    "Don't have account register here.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
                //dst
              ],
            ),
          ),
        ),
      ),
    );
  }
}
