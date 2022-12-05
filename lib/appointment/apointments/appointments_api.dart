import 'package:http/http.dart' as http;
import 'package:tetflutter/appointment/apointments/appointment_model.dart';
import 'package:tetflutter/inviroments.dart';

Future<Appointment> getAppointment() async {
  const url = '${Enviroemnts.baseUrl}/users/list_appointment/0/';
  final uri = Uri.parse(url);

  final response = await http.get(uri);
  final decodeData = appointmentFromJson(response.body);
  return decodeData;
}
