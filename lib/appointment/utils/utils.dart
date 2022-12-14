import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetflutter/appointment/apointments/appointment_model.dart';
import 'package:tetflutter/appointment/apointments/appointments.dart';
import 'package:tetflutter/appointment/apointments/appointments_api.dart';
import 'package:tetflutter/appointment/apointments/controller_appointment.dart';
import 'package:tetflutter/appointment/home_Appointment.dart';

class ListAppointment extends StatelessWidget {
  const ListAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final controlller = Get.put(ControllerAppointment());

    return Obx(
      () {
        return FutureBuilder(
          future: getAppointment(controlller.isfinish.value),
          builder: (BuildContext context, AsyncSnapshot<Appointment> snapshot) {
            final dataAppointments = snapshot.data;
            return !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: dataAppointments!.counts,
                    itemBuilder: (BuildContext context, int index) {
                      return FadeInLeft(
                        child: Card(
                          color: dataAppointments.appointmentsFinish![index]
                                      .statustAppointment ==
                                  true
                              ? const Color.fromARGB(180, 255, 101, 90)
                              : const Color.fromARGB(179, 115, 240, 119),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          elevation: 10,
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.all(10),
                                title: Text(
                                  'Numero de cita: ${dataAppointments.appointmentsFinish![index].id}',
                                  style: const TextStyle(fontFamily: 'Raleway'),
                                ),
                                subtitle: Text(
                                    'Fecha de cita: ${dataAppointments.appointmentsFinish![index].dateAppointment ?? ''}'),
                                leading: Image.asset(
                                  'assets/logo2.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Divider(),
                              ListTile(
                                title: const Text('Datos del paciente  '),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(dataAppointments
                                            .appointmentsFinish![index]
                                            .namePatient ??
                                        'Jose alejandro Cruz Perez'),
                                    Text(dataAppointments
                                            .appointmentsFinish![index]
                                            .lastNamePatient ??
                                        '9631965748'),
                                    Text(dataAppointments
                                            .appointmentsFinish![index]
                                            .emailPatient ??
                                        'josealejandroc22@gmail.com'),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Text(
                                  'Hora de cita: ${dataAppointments.appointmentsFinish![index].appointmentTime ?? ''}'),
                              Text(
                                'DESCRIPCION DE LA CITA: ${dataAppointments.appointmentsFinish![index].descriptionPatient ?? ''}',
                                style: const TextStyle(fontFamily: 'Raleway'),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    onPressed: dataAppointments
                                                .appointmentsFinish![index]
                                                .statustAppointment ==
                                            true
                                        ? null
                                        : () {},
                                    child: const Text('Cancelar'),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    onPressed: dataAppointments
                                                .appointmentsFinish![index]
                                                .statustAppointment ==
                                            true
                                        ? null
                                        : () {
                                            final indexAppointment =
                                                dataAppointments
                                                    .appointmentsFinish![index]
                                                    .id;
                                            deleteAppoinmet(indexAppointment!);
                                            final newRoute = MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeAppointment());
                                            Navigator.pushReplacement(
                                                context, newRoute);
                                          },
                                    child: const Text('Aceptar'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        );
      },
    );
  }
}
