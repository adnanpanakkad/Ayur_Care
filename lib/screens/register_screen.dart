import 'package:ayur_care/utils/app_colors.dart';
import 'package:ayur_care/utils/app_text_styles.dart';
import 'package:ayur_care/widgets/common/custom_appbar.dart';
import 'package:ayur_care/widgets/home/drop_down.dart';
import 'package:ayur_care/widgets/register/radio_button.dart';
import 'package:ayur_care/widgets/login/custom_buttom.dart';
import 'package:ayur_care/widgets/login/custom_textfeid.dart';
import 'package:ayur_care/widgets/register/treatment_picker.dart';
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Register',
                    style: CustomTextStyle.highboldTxtStyle,
                  ),
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
                      Text(
                        'Treatments',
                        style: CustomTextStyle.textFieldlabelstyle,
                      ),
                      TreatmentPicker(),
                      CustomTextfield(labelText: 'Total Amount'),
                      CustomTextfield(labelText: 'Discount Amount'),
                      Text(
                        'Payment Option',
                        style: CustomTextStyle.textFieldlabelstyle,
                      ),
                      RadioButton(),
                      CustomTextfield(labelText: 'Advance Amount'),
                      CustomTextfield(labelText: 'Balance Amount'),
                      Row(
                        children: [
                          DropdownButtons(),
                        ],
                      ),
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
