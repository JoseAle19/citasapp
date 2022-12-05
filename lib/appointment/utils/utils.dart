import 'package:animate_do/animate_do.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:tetflutter/appointment/apointments/appointment_model.dart';
import 'package:tetflutter/appointment/apointments/appointments_api.dart';

class ListAppointment extends StatelessWidget {
  ListAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAppointment(),
      builder: (BuildContext context, AsyncSnapshot<Appointment> snapshot) {
        final dataAppintments = snapshot.data;
        return !snapshot.hasData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: dataAppintments!.counts,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInLeft(
                    child: Card(
                      color: dataAppintments.status == true
                          ? const Color.fromARGB(179, 115, 240, 119)
                          : const Color.fromARGB(180, 255, 101, 90),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.all(10),
                      elevation: 10,
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            title: Text(
                              'Numero de cita: ${dataAppintments.appointmentsFinish![index].id}',
                              style: const TextStyle(fontFamily: 'Raleway'),
                            ),
                            subtitle: Text(
                                'Fecha de cita: ${dataAppintments.appointmentsFinish![index].dateAppointment ?? ''}'),
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
                                Text(dataAppintments.appointmentsFinish![index]
                                        .namePatient ??
                                    'Jose alejandro Cruz Perez'),
                                Text(dataAppintments.appointmentsFinish![index]
                                        .lastNamePatient ??
                                    '9631965748'),
                                Text(dataAppintments.appointmentsFinish![index]
                                        .emailPatient ??
                                    'josealejandroc22@gmail.com'),
                              ],
                            ),
                          ),
                          const Divider(),
                          Text(
                              'Hora de cita: ${dataAppintments.appointmentsFinish![index].appointmentTime ?? ''}'),
                          Text(
                            'DESCRIPCION DE LA CITA: ${dataAppintments.appointmentsFinish![index].descriptionPatient ?? ''}',
                            style: const TextStyle(fontFamily: 'Raleway'),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: dataAppintments.status == true
                                    ? () {}
                                    : null,
                                child: const Text('Cancelar'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: dataAppintments.status == true
                                    ? () {}
                                    : null,
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
  }
}

class DatePicker extends StatefulWidget {
  const DatePicker({
    Key? key,
    required this.timeAppointment,
  }) : super(key: key);

  final DateTime timeAppointment;
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
        decoration: const InputDecoration(
            hintText: 'Selecciona una fecha', border: InputBorder.none),
        selectedDate: widget.timeAppointment,
        onDateSelected: (DateTime value) {
          setState(() {
            selectedDate = value;
          });
        });
  }
}
