import 'package:flutter/material.dart';
import 'package:tetflutter/register/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 9,
      width: double.maxFinite,
      child: Stack(
        children: [
          Column(
            children: [
              Center(
                child: SizedBox(
                  height: size.height * .5,
                  width: double.maxFinite,
                  child: Image.asset(
                    "assets/logo.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: size.height * .42,
            left: size.width * .5 + -200,
            child: Column(
              children: [
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Inputs(
                        hint: "Nombre de usuario",
                      ),
                      const Inputs(
                        hint: "Correo",
                      ),
                      const Inputs(
                        hint: "Contraseña",
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 59, 111, 233),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Iniciar sesión",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text("¿No tienes cuenta?"),
                    TextButton(
                        onPressed: () {
                          final route = MaterialPageRoute(
                              builder: (context) => const RegisterPage());
                          Navigator.push(context, route);
                        },
                        child: const Text(
                          "Crear cuenta",
                          style: TextStyle(
                              color: Color.fromARGB(255, 59, 111, 233),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Inputs extends StatelessWidget {
  const Inputs({super.key, required this.hint});
  // ignore: prefer_typing_uninitialized_variables
  final hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }
}
