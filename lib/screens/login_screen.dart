import 'package:ayur_care/controller/api_controller.dart';
import 'package:ayur_care/controller/login_controller.dart';
import 'package:ayur_care/screens/home_screen.dart';
import 'package:ayur_care/screens/widgets/utils/app_text_styles.dart';
import 'package:ayur_care/screens/widgets/common/custom_snackbar.dart';
import 'package:ayur_care/screens/widgets/login/custom_buttom.dart';
import 'package:ayur_care/screens/widgets/login/custom_textfeid.dart';
import 'package:ayur_care/screens/widgets/login/image_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);
    final apiController = Provider.of<ApiController>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ImageContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Form(
                      key: loginController.loginFormkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Login Or Register To Book Your Appointments',
                            style: CustomTextStyle.highboldTxtStyle,
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          CustomTextfield(
                              validation: (value) =>
                                  loginController.textFieldValidation(value),
                              controller: loginController.emailController,
                              hintText: 'Email your email',
                              labelText: 'Email'),
                          const SizedBox(
                            height: 10,
                          ),

                          CustomTextfield(
                              validation: (value) =>
                                  loginController.validatePassword(value),
                              controller: loginController.passwordController,
                              hintText: 'Enter password',
                              labelText: 'password'),
                          const SizedBox(height: 70),

                          // Login Button
                          CustomButton(
                            text: 'Login',
                            onTap: () async {
                              if (loginController.loginFormkey.currentState!
                                  .validate()) {
                                try {
                                  final usertoken =
                                      await apiController.loginUser(
                                    userName: loginController
                                        .emailController.text
                                        .trim(),
                                    password: loginController
                                        .passwordController.text
                                        .trim(),
                                  );

                                  if (usertoken != null) {
                                    // Save the token to SharedPreferences
                                    final sharedpref =
                                        await SharedPreferences.getInstance();
                                    await sharedpref.setString(
                                        'token', usertoken);

                                    // Navigate to HomeScreen
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ),
                                    );
                                  
                                    // Show success Snackbar
                                    CustomSnackbar.show(
                                      context: context,
                                      title: 'Success',
                                      subtitle: 'Login successful',
                                      color: Colors.green.shade600,
                                      icon: Icons.check_circle,
                                    );
                                  } else {
                                    // Show error Snackbar if token is null
                                    CustomSnackbar.show(
                                      context: context,
                                      title: 'Login Failed',
                                      subtitle:
                                          'The email or password you entered is incorrect',
                                      color: Colors.red.shade600,
                                      icon: Icons.error,
                                    );
                                  }
                                } catch (e) {
                                  // Show error Snackbar for exceptions
                                  CustomSnackbar.show(
                                    context: context,
                                    title: 'Error',
                                    subtitle: 'Please enter valid credentials',
                                    color: Colors.red.shade600,
                                    icon: Icons.error,
                                  );
                                }
                              }
                            },
                          ),

                          const SizedBox(height: 60),
                          CustomTextStyle.getDoctorDescription(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
