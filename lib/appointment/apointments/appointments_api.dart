import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tetflutter/appointment/apointments/appointment_model.dart';
import 'package:tetflutter/enviroments.dart';

Future<Appointment> getAppointment(String isFinish) async {
  final url =
      '${Enviroemnts.baseUrl}/users/list_appointment/flutter/${isFinish}/';
  final uri = Uri.parse(url);

  final response = await http.get(uri);
  final decodeData = appointmentFromJson(response.body);
  return decodeData;
}

Future<void> deleteAppoinmet(int index) async {
  final url = '${Enviroemnts.baseUrl}/users/finish_appointment/${index}/';
  final uri = Uri.parse(url);
  final body = jsonEncode({"statustAppointment": true});
  final response = await http.put(uri,
      headers: {"Content-Type": "application/json"}, body: body);
  final decodeData = json.decode(response.body);
}
