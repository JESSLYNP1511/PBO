import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nailicious_mobile/model/service.dart';

Future<List<Service>> callGetServicesApi() async {
  try {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/services'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      //assuming this json returns an array of signupresponse objects
      final List parsedList = json.decode(response.body);

      List<Service> list =
          parsedList.map((val) => Service.fromJson(val)).toList();
      return list;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      print('Response body: ${response.body}');
      return [];
    }
  } catch (e) {
    print('Error during API call: $e');
    return [];
  }
}
