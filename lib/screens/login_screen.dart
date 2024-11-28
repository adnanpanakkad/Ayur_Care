import 'package:ayur_care/controller/login_controller.dart';
import 'package:ayur_care/utils/app_text_styles.dart';
import 'package:ayur_care/widgets/login/custom_buttom.dart';
import 'package:ayur_care/widgets/login/custom_textfeid.dart';
import 'package:ayur_care/widgets/login/image_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ImageContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                          const Text(
                            'Login or register to book your appointments',
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          CustomTextField(
                              validator: (value) =>
                                  loginController.validateEmail(value),
                              controller: loginController.emailController,
                              hintText: 'hintText',
                              labelText: 'Email'),
                          const SizedBox(
                            height: 30,
                          ),

                          CustomTextField(
                              validator: (value) =>
                                  loginController.validatePassword(value),
                              controller: loginController.emailController,
                              hintText: 'hintText',
                              labelText: 'Password'),

                          const SizedBox(height: 70),

                          // Login Button
                          CustomButton(
                              text: 'Login',
                              onTap: () {
                                loginController.loginUser(context);
                              }),
                          const SizedBox(height: 70),
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
