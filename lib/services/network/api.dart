import 'dart:convert';

import 'package:valorant_api_example/services/models/valorant_model.dart';
import 'package:http/http.dart' as http;

class Apiprovider {
  Future<ValorantModel> fetchValorantData() async {
    // Replace this with your actual API call to fetch the data.
    // For example:
    final response =
        await http.get(Uri.parse('https://valorant-api.com/v1/agents'));
    if (response.statusCode == 200) {
     
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      

      return ValorantModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
