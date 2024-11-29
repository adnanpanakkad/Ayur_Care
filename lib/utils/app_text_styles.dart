import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class CustomTextStyle {
  static final TextStyle buttonTextStyle = GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle containerTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 19,
    fontWeight: FontWeight.w600,
  );

  static TextStyle highboldTxtStyle = GoogleFonts.poppins(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: Appcolor.textColor,
  );

  static final TextStyle swipeTextStyle = GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Appcolor.primaryColor,
  );

  static final TextStyle ultraBoldTextstyle = GoogleFonts.poppins(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle textFieldstyle = GoogleFonts.poppins(
    color: const Color.fromARGB(255, 157, 157, 157),
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle textFieldlabelstyle = GoogleFonts.poppins(
    color: const Color(0xFF404040),
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static Widget getDoctorDescription() {
    return Text.rich(
      TextSpan(
        text:
            'By creating or logging into an account you are agreeing with our ',
        style: GoogleFonts.poppins(color: Colors.black), // Default text style
        children: <TextSpan>[
          TextSpan(
            text: 'Terms and Conditions', // Highlighted text
            style: GoogleFonts.poppins(color: Colors.blue),
          ),
          TextSpan(
            text: ' and ',
            style: GoogleFonts.poppins(color: Colors.black),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: GoogleFonts.poppins(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
