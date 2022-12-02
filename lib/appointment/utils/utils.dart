import 'package:flutter/material.dart';
import 'package:tetflutter/appointment/apointments/appointments_api.dart';

class ListAppointment extends StatelessWidget {
  const ListAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: dataAppintments.length,
      separatorBuilder: (BuildContext context, int index) {
        final data = dataAppintments[index];
        return Cards(data: data);
      },
      itemBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 3,
          indent: 10,
        );
      },
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 190, 218, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(240, 176, 202, 236),
              borderRadius: BorderRadius.circular(50),
            ),
            margin: const EdgeInsets.only(top: 10, left: 10),
            height: 50,
            width: 50,
            child: Center(child: Text(data['id'] ?? '')),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    const Text(
                      'Nombre: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data['name'] ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    const Text(
                      'Apellido: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data['status'] ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    const Text(
                      'Apellido: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data['status'] ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
