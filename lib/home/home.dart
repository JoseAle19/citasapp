import 'package:flutter/material.dart';
import 'package:tetflutter/login/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      body: LoginPage(),
    );
  }
}
