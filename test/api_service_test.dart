import 'dart:convert';
import 'package:colorize/colorize.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_auction_system/service/api_service.dart';

class MockHttpClient extends http.BaseClient {
  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    return http.Response(
      jsonEncode({
        'token': 'mockToken',
        'userInfo': {'username': 'testUser'}
      }),
      200,
    );
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // TODO: implement send
    throw UnimplementedError();
  }
}

void main() {
  late ApiService apiService;

  setUp(() {
    apiService = ApiService(httpClient: MockHttpClient());
  });

  test('loginUser returns true on successful login', () async {
    final testData = createTestData();
    final userName = testData['userName'];
    final password = testData['password'];

    final result = await apiService.loginUser(userName, password);

    // Assert
    expect(result, true);
  });
}

Map<String, String> testDataSeneriorLoginTrue = {
  'userName': 'string111',
  'password': 'string141',
};
Map<String, String> createTestData() {
  Map<String, String> testDataSeneriorLoginFalse = {
    'userName': 'testUser',
    'password': 'testPassword',
  };

  print(Colorize("Enter username: ").blue());
  // print("Enter username: ");
  // userName = stdin.readLineSync()!;
  // print("Enter password: ");
  // password = stdin.readLineSync()!;

  return testDataSeneriorLoginTrue;
  //? return testDataSeneriorLoginFalse;
}
