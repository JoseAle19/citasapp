import 'package:flutter/material.dart';
import 'package:tetflutter/appointment/home_Appointment.dart';
import 'package:tetflutter/login/login.dart';
import 'package:tetflutter/utils/arrow_button.dart';
import 'package:tetflutter/utils/redirect_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                arrowButton(context),
                ChildContainer(
                  myChild: Column(
                    children: [
                      Hero(
                        tag: 'logo',
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 70,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/logo2.jpg',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          'Crea tu cuenta',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          const Inputs(
                              hint: 'Nombre de usuario',
                              typeInput: TextInputType.emailAddress),
                          const Inputs(
                              hint: 'Numero de telefono',
                              typeInput: TextInputType.emailAddress),
                          const Inputs(
                              hint: 'Correo',
                              typeInput: TextInputType.emailAddress),
                          const Inputs(
                              hint: 'Contraseña',
                              typeInput: TextInputType.text,
                              seePassword: true),
                          const Inputs(
                              hint: 'Confirmar contraseña',
                              typeInput: TextInputType.text,
                              seePassword: true),
                          Hero(
                              tag: 'goToPage',
                              child: goToPage(context, 'Crear cuenta')),
                        ],
                      ),
                      ChildContainer(
                        myChild: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Ya tienes cuenta?, '),
                            TextButton(
                              onPressed: () {
                                // Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeAppointment()));
                              },
                              child: const Text('Iniciar de sesión'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
