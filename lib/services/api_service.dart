import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://data.cityofnewyork.us/resource/erm2-nwe9.json';

    Future<List<dynamic>> getComplaints() async {
    final url = Uri.parse(
      '$baseUrl?\$limit=20',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception(
         'Failed to load complaints: ${response.statusCode}',
    );
    }
  }
}