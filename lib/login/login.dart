import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tetflutter/register/register.dart';
import 'package:tetflutter/users/user.dart';
import 'package:tetflutter/utils/redirect_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          ChildContainer(
            myChild: Container(
              margin: const EdgeInsets.only(top: 40),
              // color: Colors.red,
              child: Column(
                children: [
                  Hero(
                    tag: 'logo',
                    child: FadeInLeftBig(
                      duration: const Duration(milliseconds: 800),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/logo2.jpg',
                          ),
                        ),
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
              ChildContainer(
                myChild: Column(
                  children: [
                    Column(
                      children: [
                        const Inputs(
                            hint: 'Correo',
                            typeInput: TextInputType.emailAddress),
                        const Inputs(
                            hint: 'Contraseña',
                            typeInput: TextInputType.text,
                            seePassword: true),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Hero(
                                tag: 'goToPage',
                                child: goToPage(context, 'Iniciar sesión'),
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
                  ],
                ),
              ),
              ChildContainer(
                myChild: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('¿No tienes cuenta?, '),
                      TextButton(
                        onPressed: () {
                          final route = MaterialPageRoute(
                              builder: (context) => const RegisterPage());

                          Navigator.push(context, route);
                        },
                        child: const Text('Registrarse'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ChildContainer extends StatelessWidget {
  const ChildContainer({super.key, required this.myChild});
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
  const Inputs(
      {super.key,
      required this.hint,
      required this.typeInput,
      this.seePassword});
  final String hint;
  final TextInputType typeInput;
  final bool? seePassword;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 5),
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: TextFormField(
          obscureText: seePassword ?? false,
          keyboardType: typeInput,
          decoration: InputDecoration(border: InputBorder.none, hintText: hint),
        ));
  }
}
