import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://swdprojectapi.azurewebsites.net/api/';
  static String jwtToken = '';
  static String currentEmail = '';
  static String currentUserId = '';
  static String currentUserName = '';
  //static String role = '';

  // ========================= AUTHENTICATION API ==============================
  static Future<String> fetchJwtToken(String email) async {
    final url = Uri.parse('${baseUrl}accounts/login');
    final body = jsonEncode(email);
    print(email);
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: body);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      jwtToken = data['accessToken'];
      currentEmail = email;
      currentUserId = data['id'];
      currentUserName = data['userName'];

      return jwtToken;
    } else if (response.statusCode == 401) {
      // Access token expired, try refreshing the token using the refresh token
      final refreshToken = json.decode(response.body)['refreshToken'];
      final refreshResponse = await http.post(
        Uri.parse('${baseUrl}accounts/login/refresh'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'refreshToken': refreshToken,
        }),
      );

      if (refreshResponse.statusCode == 200) {
        final refreshData = json.decode(refreshResponse.body);
        jwtToken = refreshData['accessToken'];
        currentEmail = email;
        return jwtToken;
      } else {
        throw Exception('Failed to refresh JWT token');
      }
    } else {
      throw Exception('Failed to fetch JWT token ${response.statusCode}');
    }
  }
  //===========================GET ROLE API===============================
}
