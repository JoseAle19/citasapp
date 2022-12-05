import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetflutter/appointment/apointments/controller_appointment.dart';

import 'package:tetflutter/appointment/utils/utils.dart';
import 'package:tetflutter/utils/arrow_button.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ControllerAppointment());
    return Scaffold(
      persistentFooterButtons: [
        Obx((() => Center(
              child: controller.changeNumber.value == true
                  ? const Text('Citas pendientes')
                  : const Text('Citas Terminadas'),
            )))
      ],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          arrowButton(context),
          const Expanded(child: ListAppointment())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          controller.changeNumber.value = !controller.changeNumber.value;
          if (controller.changeNumber.value == true) {
            controller.isfinish.value = '1';
          } else {
            controller.isfinish.value = '0';
          }
        },
        child: const Icon(Icons.change_circle),
      ),
    );
  }
}
