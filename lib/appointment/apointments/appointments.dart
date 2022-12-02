import 'package:flutter/material.dart';
import 'package:tetflutter/appointment/utils/utils.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 58, 58),
        title: Text('Citas pendientes'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListAppointment(),
    );
  }
}
