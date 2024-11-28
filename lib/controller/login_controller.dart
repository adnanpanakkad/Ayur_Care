import 'package:flutter/material.dart';
import 'package:ayur_care/model/user_model.dart';  // Import UserModel
import '../widgets/common/custom_snackbar.dart';  // Assuming this is your custom snackbar

class LoginController with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormkey = GlobalKey<FormState>();

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

  // The login function with context for Snackbar
  loginUser(BuildContext context) async {
    if (loginFormkey.currentState!.validate()) {
      try {
        
        final userModel = UserModel(email: emailController.text, password: passwordController.text);
        
        // Example logic: If login is successful, navigate to the next screen (or whatever you want to do)
        // You would replace this with actual authentication logic (e.g., API call or Firebase)
        if (userModel.email == 'test@example.com' && userModel.password == 'password123') {
          
          emailController.clear();
          passwordController.clear();
          
          // Show success snackbar
          CustomSnackbar.show(
            context: context,
            title: 'Success',
            subtitle: 'Login successful',
            color: Colors.green.shade600,
            icon: Icons.check_circle,
          );
        } else {
          // On failure
          CustomSnackbar.show(
            context: context,
            title: 'Error',
            subtitle: 'Login failed. Please check your credentials.',
            color: Colors.red.shade600,
            icon: Icons.error,
          );
        }
      } catch (e) {
        CustomSnackbar.show(
          context: context,
          title: 'Error',
          subtitle: 'An unexpected error occurred. Please try again.',
          color: Colors.red.shade600,
          icon: Icons.error,
        );
      }
    } else {
      // Show error if the form is invalid
      CustomSnackbar.show(
        context: context,
        title: 'Error',
        subtitle: 'Please enter valid credentials',
        color: Colors.red.shade600,
        icon: Icons.cancel_outlined,
      );
    }
  }
}
