import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  void handleLogin() {
    if (emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty) {
      debugPrint("email and password required");
    }

    if (emailCtrl.text == "admin@gmail.com" && passwordCtrl.text == "admin") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Login Failed")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //login here
            SizedBox(height: 100),
            Center(
              child: Text(
                "Login here",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
            ),
            SizedBox(height: 16),
            //welcome back
            Text(
              "Welcome back you've been missed!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            //email tf
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            //password tf
            SizedBox(height: 16),
            //email tf
            TextField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            //reset password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            //login button
            ElevatedButton(
              onPressed: () => handleLogin(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                backgroundColor: Colors.blueAccent,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Login", style: TextStyle(color: Colors.white)),
            ),

            //create account
            //with other account
          ],
        ),
      ),
    );
  }
}
