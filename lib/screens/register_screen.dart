import 'package:ayur_care/controller/register_controller.dart';
import 'package:ayur_care/utils/app_colors.dart';
import 'package:ayur_care/utils/app_text_styles.dart';
import 'package:ayur_care/widgets/common/custom_appbar.dart';
import 'package:ayur_care/widgets/home/drop_down.dart';
import 'package:ayur_care/widgets/register/radio_button.dart';
import 'package:ayur_care/widgets/login/custom_buttom.dart';
import 'package:ayur_care/widgets/login/custom_textfeid.dart';
import 'package:ayur_care/widgets/register/time_picker.dart';
import 'package:ayur_care/widgets/register/treatment_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Provider.of<RegisterController>(context);
    return Scaffold(
      backgroundColor: Appcolor.primaryColor,
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Register',
                    style: CustomTextStyle.highboldTxtStyle,
                  ),
                ),
                const Divider(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextfield(
                          hintText: 'Enter your full name', labelText: 'Name'),
                      const CustomTextfield(
                          hintText: 'Enter your Whatsapp number',
                          labelText: 'Whatsapp Number'),
                      const CustomTextfield(
                          hintText: 'Enter your full address',
                          labelText: 'Address'),
                      const CustomTextfield(
                          hintText: 'Choose your location',
                          labelText: 'Location'),
                      const CustomTextfield(
                          hintText: 'Select the branch', labelText: 'Branch'),
                      Text(
                        'Treatments',
                        style: CustomTextStyle.textFieldlabelstyle,
                      ),
                      const TreatmentPicker(),
                      const CustomTextfield(labelText: 'Total Amount'),
                      const CustomTextfield(labelText: 'Discount Amount'),
                      Text(
                        'Payment Option',
                        style: CustomTextStyle.textFieldlabelstyle,
                      ),
                      const RadioButton(),
                      const CustomTextfield(labelText: 'Advance Amount'),
                      const CustomTextfield(labelText: 'Balance Amount'),
                      Text(
                        'Payment Option',
                        style: CustomTextStyle.textFieldlabelstyle,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TimeSlotPiker(
                              hintText: 'Hour',
                              controller:
                                  registerController.starttimeController,
                              validation: (value) =>
                                  registerController.textFieldValidation(value),
                              onTap: () =>
                                  registerController.pickStartTime(context),
                            ),
                          ),
                          SizedBox(width: 10), // Space between the two fields
                          Expanded(
                            child: TimeSlotPiker(
                              hintText: 'Minutes',
                              controller: registerController.endtimeController,
                              validation: (value) =>
                                  registerController.textFieldValidation(value),
                              onTap: () =>
                                  registerController.pickEndTime(context),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
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
