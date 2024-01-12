import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseClass {
  Future<dynamic> put(dynamic object) async {
    var url = Uri.parse(
        "http://172.105.37.117:8000/Ivin_1/InsideVoterUpdateVoter2024/Alamanda Koduru-193/12/");
    var _payload = json.encode(object);
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA5NTMzMzQ0LCJpYXQiOjE3MDE3NTczNDQsImp0aSI6IjlmZDAzMTUzYmUzZTQ4MjdiMDM1NTdjNWFkNzMyYTM5IiwidXNlcl9pZCI6Mn0.8qoWaUFlKj0lciCQlAo_dFqieaIfcyDTBXQ40ssg5X4', // Add the Bearer token to the headers
    };
    var response =
        await http.Client().put(url, body: _payload, headers: headers);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("Errorrorororo");
    }
  }
}
