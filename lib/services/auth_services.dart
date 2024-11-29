import 'package:ayur_care/model/user_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<String?> login(UserModel user) async {
    const String loginUrl = 'https://flutter-amr.noviindus.in/api/Login';

    try {
      // Prepare form data
      FormData formData = FormData.fromMap(user.toJson());

      // Send POST request
      final response = await _dio.post(
        loginUrl,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      // Check response status
      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null && data['token'] != null) {
          String token = data['token'];
          // Store token securely using flutter_secure_storage
          return token;
        } else {
          throw Exception('Invalid response: token missing');
        }
      } else {
        throw Exception('Failed to login: ${response.statusMessage}');
      }
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }
}
