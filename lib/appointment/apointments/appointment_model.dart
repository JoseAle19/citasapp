// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

import 'dart:convert';

Appointment appointmentFromJson(String str) =>
    Appointment.fromJson(json.decode(str));

String appointmentToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  Appointment({
    this.status,
    this.message,
    this.counts,
    this.appointmentsFinish,
  });

  bool? status;
  String? message;
  int? counts;
  List<AppointmentsFinish>? appointmentsFinish;
  List<AppointmentsFinish>? appointmentsNoFinish;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
      status: json["Status"],
      message: json["Message"],
      counts: json["Counts"],
      appointmentsFinish: List<AppointmentsFinish>.from(
          json["appointmentsFinish"]
              .map((x) => AppointmentsFinish.fromJson(x))));

  get length => null;

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Counts": counts,
        "appointmentsFinish":
            List<dynamic>.from(appointmentsFinish!.map((x) => x.toJson())),
      };
}

class AppointmentsFinish {
  AppointmentsFinish({
    this.id,
    this.namePatient,
    this.lastNamePatient,
    this.emailPatient,
    this.phonePatient,
    this.descriptionPatient,
    this.dateAppointment,
    this.appointmentTime,
    this.statustAppointment,
  });

  int? id;
  String? namePatient;
  String? lastNamePatient;
  String? emailPatient;
  String? phonePatient;
  String? descriptionPatient;
  DateTime? dateAppointment;
  String? appointmentTime;
  bool? statustAppointment;

  factory AppointmentsFinish.fromJson(Map<String, dynamic> json) =>
      AppointmentsFinish(
        id: json["id"],
        namePatient: json["namePatient"],
        lastNamePatient: json["lastNamePatient"],
        emailPatient: json["emailPatient"],
        phonePatient: json["phonePatient"],
        descriptionPatient: json["descriptionPatient"],
        dateAppointment: DateTime.parse(json["dateAppointment"]),
        appointmentTime: json["appointmentTime"],
        statustAppointment: json["statustAppointment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namePatient": namePatient,
        "lastNamePatient": lastNamePatient,
        "emailPatient": emailPatient,
        "phonePatient": phonePatient,
        "descriptionPatient": descriptionPatient,
        "dateAppointment":
            "${dateAppointment!.year.toString().padLeft(4, '0')}-${dateAppointment!.month.toString().padLeft(2, '0')}-${dateAppointment!.day.toString().padLeft(2, '0')}",
        "appointmentTime": appointmentTime,
        "statustAppointment": statustAppointment,
      };
}
