import 'package:flutter/material.dart';
import 'package:tetflutter/register/register.dart';
import 'package:tetflutter/users/user.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(
        children: [
          Logo(
            myChild: Container(
              margin: const EdgeInsets.only(top: 40),
              // color: Colors.red,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/logo2.jpg',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      'Iniciar sesión',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              Logo(
                myChild: Column(
                  children: [
                    Container(
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          const Inputs(hint: 'Correo'),
                          const Inputs(hint: 'Contraseña'),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(top: 25),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Iniciar sesión'.toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  final route = MaterialPageRoute(
                                      builder: (context) => const GetUser());
                                  Navigator.push(context, route);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key, required this.myChild});
  final Widget myChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 30),
      width: double.maxFinite,
      child: myChild,
    );
  }
}

class Inputs extends StatelessWidget {
  const Inputs({super.key, required this.hint});
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 5),
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: TextFormField(
          decoration: InputDecoration(border: InputBorder.none, hintText: hint),
        ));
  }
}
