import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nailicious_mobile/model/booking.dart';

Future<Map<String, dynamic>?> callBookingApi(Booking booking) async {
  try {
    final body = jsonEncode(<String, dynamic>{
      'user_id': booking.userId!,
      'artist_id': booking.artistId,
      'service_id': booking.serviceId,
      'note': booking.note,
      'booking_time':
          DateFormat('yyyy-MM-dd HH:mm:ss').format(booking.bookingTime!)
    });
    print(body);
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/book-service'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('Error during API call: $e');
    return null;
  }
}
