import 'package:flutter/material.dart';
import 'package:my_app/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //icon
                  const Icon(Icons.person, size: 100, color: Colors.blue),
                  const Text("Register Youc Account Now",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const Text("Register Page", style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 50,
                  ),
                  //text email
                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_3_outlined),
                        border: OutlineInputBorder(),
                        labelText: "Name",
                        hintText: "Enter your name"),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  //text email
                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "Enter your email"),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        suffixIcon: Icon(Icons.remove_red_eye),
                        hintText: "Enter your password"),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        labelText: "Repeat Your Password",
                        suffixIcon: Icon(Icons.remove_red_eye),
                        hintText: "repeat your password"),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //aarah ke halaman home
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Register",
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              (route) => false);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child: const Text("Login",
                            style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  )

                  //text password
                  //button
                  //belum register
                  //ke halaman register
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
