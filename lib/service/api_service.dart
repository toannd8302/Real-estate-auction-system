import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:colorize/colorize.dart'; // For printing colored text to the console

class ApiService {
  static const String baseUrl = 'https://swdprojectapi.azurewebsites.net/api/';
  static String jwtToken = '';
  static String currentEmail = '';
  static String currentUserId = '';
  static String currentUserName = '';
  //static String role = '';
  http.Client httpClient;

  ApiService({required this.httpClient});
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

  //===========================LOGIN API========================================
  Future<bool> loginUser(String? userName, String? passWord) async {
    bool flag = false;
    final url = Uri.parse('${baseUrl}/User/login');
    final body = jsonEncode({
      'username': userName,
      'password': passWord,
    });
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'text/plain',
        },
        body: body,
      );
      //Todo: Check Resonse body
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];
        final userInfo = data['userInfo'];
        print(Colorize('Login Successful!').bgGreen());

        print(Colorize('Token: $token').red());
        print(Colorize('User Info: $userInfo').green());
        flag = true;
      } else if (response.statusCode == 400) {
        print('Bad Request: ${response.body}');
        flag = false;
      } else {
        // Handle other errors
        print('Error: ${response.statusCode}');
        flag = false;
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
      flag = false;
    }
    return flag;
  }

  //===========================REGISTER API=====================================
//   Future<bool> registerUser(
//       String? userName, String? passWord, String? email) async {
//     bool flag = false;
//     final url = Uri.parse('${baseUrl}/User/register');
//     final body = jsonEncode({
//       'username': userName,
//       'password': passWord,
//       'email': email,
//     });
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           'accept': 'text/plain',
//         },
//         body: body,
//       );
// }
//       }
}
