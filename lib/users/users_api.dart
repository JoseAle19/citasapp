import 'package:http/http.dart' as http;
import 'package:tetflutter/enviroments.dart';

import 'model.dart';

Future<Users> getUser() async {
  print('Nueva peticion');
  // const url = 'https://citasapi.onrender.com/users/listUsers/';
  const url = '${Enviroemnts.baseUrl}/users/listUsers/';
  final uri = Uri.parse(url);

  final response = await http.get(uri);
  final decodeData = usersFromJson(response.body);
  return decodeData;
}
