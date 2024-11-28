import 'package:ayur_care/utils/app_colors.dart';
import 'package:ayur_care/utils/app_text_styles.dart';
import 'package:ayur_care/widgets/common/custom_appbar.dart';
import 'package:ayur_care/widgets/home/radio_button.dart';
import 'package:ayur_care/widgets/login/custom_buttom.dart';
import 'package:ayur_care/widgets/login/custom_textfeid.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primaryColor,
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          // Scrollable content
          const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: CustomTextStyle.highboldTxtStyle,
                ),
                Divider(),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextfield(
                          hintText: 'Enter name', labelText: 'Name'),
                      CustomTextfield(
                          hintText: 'Enter email',
                          labelText: 'Whatsapp Number'),
                      CustomTextfield(
                          hintText: 'Enter phone', labelText: 'Address'),
                      CustomTextfield(
                          hintText: 'Enter password', labelText: 'Location'),
                      CustomTextfield(
                          hintText: 'Enter address', labelText: 'Branch'),
                      CustomTextfield(
                          hintText: 'Enter city', labelText: 'Total Amount'),
                      CustomTextfield(
                          hintText: 'Enter state',
                          labelText: 'Discount Amount'),
                      Text(
                        'Payment Option',
                        style: CustomTextStyle.textFieldlabelstyle,
                      ),
                      RadioButton(),
                      CustomTextfield(
                          hintText: 'Enter zip code',
                          labelText: 'Advance Amount'),
                      CustomTextfield(
                          hintText: 'Enter country',
                          labelText: 'Balance Amount'),
                      CustomTextfield(
                          hintText: 'Enter profession',
                          labelText: 'Treatment Date'),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Sticky Button
          Positioned(
              left: 15,
              right: 15,
              bottom: 20,
              child: CustomButton(text: 'Save', onTap: () {})),
        ],
      ),
    );
  }
}
