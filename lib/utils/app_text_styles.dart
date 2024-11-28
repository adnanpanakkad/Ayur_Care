import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomTextStyle {
  static const TextStyle buttonTextStyle = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w600, fontFamily: "Urbanist");
  static const TextStyle containerTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 19,
      fontWeight: FontWeight.w600,
      fontFamily: "Urbanist");

  static const TextStyle highboldTxtStyle = TextStyle(
      fontSize: 29,
      fontWeight: FontWeight.w600,
      fontFamily: 'Urbanist',
      color: Color.fromARGB(255, 53, 53, 53));

  static const TextStyle swipeTextStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      fontFamily: "Urbanist",
      color: Appcolor.primaryColor);

  static const TextStyle ultraBoldTextstyle = TextStyle(
      fontSize: 35, fontFamily: 'Urbanist', fontWeight: FontWeight.bold);

  static const TextStyle textFieldstyle = TextStyle(
      color: Color.fromARGB(255, 157, 157, 157),
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: "Urbanist");
  static const TextStyle textFieldlabelstyle = TextStyle(
      color: Color.fromARGB(137, 0, 0, 0),
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: "Urbanist");
  static getDoctorDescription() {
    return const Text.rich(
      TextSpan(
        text:
            'By creating or logging into an account you are agreeing with our ',
        style: TextStyle(color: Colors.black), // Default text color
        children: <TextSpan>[
          TextSpan(
            text: 'Terms and Conditions', // The part you want to make blue
            style: TextStyle(color: Colors.blue), // Blue color
          ),
          TextSpan(
            text: ' and ',
            style: TextStyle(color: Colors.black), // Default text color
          ),
          TextSpan(
            text: 'Privacy Policy', // The part you want to make blue
            style: TextStyle(color: Colors.blue), // Blue color
          ),
        ],
      ),
    );
  }
}
