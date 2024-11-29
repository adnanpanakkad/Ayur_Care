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
                              hintText: 'Email',
                              labelText: 'Email'),
                          const SizedBox(
                            height: 10,
                          ),

                          CustomTextfield(
                              validation: (value) =>
                                  loginController.validatePassword(value),
                              controller: loginController.passwordController,
                              hintText: 'password',
                              labelText: 'password'),
                          const SizedBox(height: 70),

                          // Login Button
                          CustomButton(
                              text: 'Login',
                              onTap: () {
                                loginController.loginUser(context);
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //       builder: (context) => const HomeScreen()),
                                // );
                              }),
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
