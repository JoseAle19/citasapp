import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'model.dart';
import 'users_api.dart';

class GetUser extends StatelessWidget {
  const GetUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 8, 8),
        elevation: 0.0,
        title: const Text('Citas kairo'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getUser(),
        builder: (BuildContext context, AsyncSnapshot<Users> snapshot) {
          final data = snapshot.data;
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: data!.counts,
              itemBuilder: (BuildContext context, int index) {
                return ZoomIn(
                  child: Carduser(data: data, index: index),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Carduser extends StatelessWidget {
  const Carduser({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final Users? data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.all(10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color.fromARGB(248, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 80, left: 10, right: 10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(220, 49, 49, 49),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 232, 230, 230),
                        width: double.maxFinite,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            const Center(
                              child: Text(
                                'Datos de contacto',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Conrreo: ${data!.users![index].email}',
                                ),
                                Text(
                                    'Contraseña: ${data!.users![index].password}'),
                                Text('Telefono: ${data!.users![index].phone}'),
                                Text('Rol: ${data!.users![index].rol}'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.network(
                    data!.users![index].image ?? 'sin imagen',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          OptionsButtons()
        ],
      ),
    );
  }
}

class OptionsButtons extends StatefulWidget {
  const OptionsButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<OptionsButtons> createState() => _OptionsButtonsState();
}

class _OptionsButtonsState extends State<OptionsButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {},
            child: const Text('Actualizar'),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              final newRoute = MaterialPageRoute(builder: (context) {
                return const GetUser();
              });
              Navigator.pushReplacement(context, newRoute);
            },
            child: const Text('Eliminar'),
          ),
        ),
      ],
    );
  }
}
