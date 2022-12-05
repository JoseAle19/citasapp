import 'package:flutter/material.dart';

import 'package:tetflutter/appointment/utils/utils.dart';
import 'package:tetflutter/utils/arrow_button.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [arrowButton(context), Expanded(child: ListAppointment())],
      ),
    );
  }
}
