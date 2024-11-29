import 'package:ayur_care/screens/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../widgets/common/custom_snackbar.dart';

class LoginController with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormkey = GlobalKey<FormState>();
  final _storage = const FlutterSecureStorage();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? textFieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  loginUser(BuildContext context) async {
    if (loginFormkey.currentState!.validate()) {
      try {
        final dio = Dio();
        const loginUrl = 'https://flutter-amr.noviindus.in/api/Login';
        final response = await dio.post(
          loginUrl,
          data: {
            'username': emailController.text,
            'password': passwordController.text,
          },
        );

        if (response.statusCode == 200 && response.data['token'] != null) {
          // On success
          emailController.clear();
          passwordController.clear();

          // Navigate to home screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );

          CustomSnackbar.show(
            context: context,
            title: 'Success',
            subtitle: 'Login successful',
            color: Colors.green.shade600,
            icon: Icons.check_circle,
          );
        } else {
          // Handle invalid credentials
          CustomSnackbar.show(
            context: context,
            title: 'Error',
            subtitle: 'Invalid email or password',
            color: Colors.red.shade600,
            icon: Icons.error,
          );
        }
      } catch (e) {
        // Handle unexpected errors
        CustomSnackbar.show(
          context: context,
          title: 'Error',
          subtitle: 'An unexpected error occurred. Please try again.',
          color: Colors.red.shade600,
          icon: Icons.error,
        );
      }
    } else {
      // Handle invalid form
      CustomSnackbar.show(
        context: context,
        title: 'Error',
        subtitle: 'Please enter valid credentials',
        color: Colors.red.shade600,
        icon: Icons.cancel_outlined,
      );
    }
  }

  Future<void> storeToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }
}
