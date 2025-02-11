import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = "https://arizshad-002-site5.ktempurl.com/api/Default";

  static Future<String?> sendAccountName(String accountName) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"accountName": accountName}),
      );

      if (response.statusCode == 200) {
        return response.body; // API response
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Exception: $e";
    }
  }
}
