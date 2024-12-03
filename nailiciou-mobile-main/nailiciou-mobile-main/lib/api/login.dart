import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> callLoginApi(
    String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
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
