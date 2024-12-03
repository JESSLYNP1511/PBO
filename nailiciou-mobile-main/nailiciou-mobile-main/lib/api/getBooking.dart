import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nailicious_mobile/model/booking.dart';

Future<List<Booking>> callGetBookingsApi(int userId) async {
  try {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/user/bookings/${userId.toString()}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List parsedList = json.decode(response.body);

      List<Booking> list =
          parsedList.map((val) => Booking.fromJson(val)).toList();
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
