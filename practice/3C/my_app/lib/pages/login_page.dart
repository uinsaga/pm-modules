import 'package:flutter/material.dart';
import 'package:my_app/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 12,
                ),
                //icon
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.verified_user, size: 100, color: Colors.blue),
                      Text("Welcome to my app",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text("Login Page", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/coffee.png",
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                labelText: "Email",
                                hintText: "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          //text password
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
                            child: const Text("Login",
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage(),
                                      ),
                                      (route) => false);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                ),
                                child: const Text("Register",
                                    style: TextStyle(color: Colors.blue)),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                //text password
                //button
                //belum register
                //ke halaman register
              ],
            ),
          ),
        ),
      ),
    );
  }
}
