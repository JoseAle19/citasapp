import 'package:http/http.dart' as http;
import 'package:tetflutter/inviroments.dart';

import 'model.dart';

Future<Users> getUser() async {
  // const url = 'https://citasapi.onrender.com/users/listUsers/';
  const url = '${Enviroemnts.baseUrl}/users/listUsers/';
  final uri = Uri.parse(url);

  final response = await http.get(uri);
  final decodeData = usersFromJson(response.body);
  return decodeData;
}
