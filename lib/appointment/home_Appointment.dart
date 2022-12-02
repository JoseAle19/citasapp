import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetflutter/appointment/apointments/appointments.dart';

import 'home_controller.dart';

class HomeAppointment extends StatelessWidget {
  const HomeAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Obx(
      () {
        return Scaffold(
          body: bodyIndex(controller.currentIndex.value),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (value) => controller.currentIndex.value = value,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.notes_outlined),
                label: 'Citas pendientes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: Color.fromARGB(255, 11, 88, 151),
          ),
        );
      },
    );
  }

  Widget bodyIndex(int index) {
    switch (index) {
      case 0:
        return const Appointments();
      case 1:
        return Center(
          child: Text('Profile'),
        );
      default:
        return Center(
          child: Text('Citas pendientes'),
        );
    }
  }
}
