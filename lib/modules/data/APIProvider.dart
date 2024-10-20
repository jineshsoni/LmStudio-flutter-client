import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<http.Response> getRequest({required String endpoint}) async {
    try {
      final response = await http.get(Uri.parse(endpoint));
      return response;
    } catch (e) {
      rethrow;
    }
  }
  static Future<http.Response> postRequest({required String endpoint, required Map<String, dynamic> jsonBody}) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      final response = await http.post(Uri.parse(endpoint), body: jsonEncode(jsonBody), headers: headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}