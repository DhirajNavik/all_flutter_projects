import 'dart:convert';

import 'package:covidapp/Model/world_states_model.dart';
import 'package:covidapp/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> fecthWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("error..");
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception("Error..");
    }
  }
}
