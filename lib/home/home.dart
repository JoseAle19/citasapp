import 'package:flutter/material.dart';
import 'package:tetflutter/login/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(246, 50, 88, 239),
        title: const Text("Consultorio kairo"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const LoginPage(),
    );
  }
}
