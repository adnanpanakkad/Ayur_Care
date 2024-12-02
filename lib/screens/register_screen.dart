import 'package:ayur_care/controller/pdf_controller.dart';
import 'package:ayur_care/controller/register_controller.dart';
import 'package:ayur_care/screens/widgets/utils/app_colors.dart';
import 'package:ayur_care/screens/widgets/utils/app_text_styles.dart';
import 'package:ayur_care/screens/widgets/common/custom_appbar.dart';
import 'package:ayur_care/screens/widgets/register/radio_button.dart';
import 'package:ayur_care/screens/widgets/login/custom_buttom.dart';
import 'package:ayur_care/screens/widgets/login/custom_textfeid.dart';
import 'package:ayur_care/screens/widgets/register/time_picker.dart';
import 'package:ayur_care/screens/widgets/register/treatment_picker.dart';
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
                  child: Form(
                    key: registerController.registerFormkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextfield(
                            validation: (value) =>
                                registerController.textFieldValidation(value),
                            hintText: 'Enter your full name',
                            labelText: 'Name'),
                        CustomTextfield(
                            validation: (value) =>
                                registerController.textFieldValidation(value),
                            hintText: 'Enter your Whatsapp number',
                            labelText: 'Whatsapp Number'),
                        CustomTextfield(
                            validation: (value) =>
                                registerController.textFieldValidation(value),
                            hintText: 'Enter your full address',
                            labelText: 'Address'),
                        CustomTextfield(
                            validation: (value) =>
                                registerController.textFieldValidation(value),
                            hintText: 'Choose your location',
                            labelText: 'Location'),
                        CustomTextfield(
                            validation: (value) =>
                                registerController.textFieldValidation(value),
                            hintText: 'Select the branch',
                            labelText: 'Branch'),
                        Text(
                          'Treatments',
                          style: CustomTextStyle.textFieldlabelstyle,
                        ),
                        const TreatmentPicker(),
                        CustomTextfield(
                          labelText: 'Total Amount',
                          validation: (value) =>
                              registerController.textFieldValidation(value),
                        ),
                        CustomTextfield(
                          labelText: 'Discount Amount',
                          validation: (value) =>
                              registerController.textFieldValidation(value),
                        ),
                        Text(
                          'Payment Option',
                          style: CustomTextStyle.textFieldlabelstyle,
                        ),
                        const RadioButton(),
                        CustomTextfield(
                          labelText: 'Advance Amount',
                          validation: (value) =>
                              registerController.textFieldValidation(value),
                        ),
                        CustomTextfield(
                          labelText: 'Balance Amount',
                          validation: (value) =>
                              registerController.textFieldValidation(value),
                        ),
                        Text(
                          'Treatment Time',
                          style: CustomTextStyle.textFieldlabelstyle,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TimeSlotPiker(
                                hintText: 'Hour',
                                controller:
                                    registerController.starttimeController,
                                validation: (value) => registerController
                                    .textFieldValidation(value),
                                onTap: () =>
                                    registerController.pickStartTime(context),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TimeSlotPiker(
                                hintText: 'Minutes',
                                controller:
                                    registerController.endtimeController,
                                validation: (value) => registerController
                                    .textFieldValidation(value),
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
                ),
              ],
            ),
          ),
          // Sticky Button
          Positioned(
            left: 15,
            right: 15,
            bottom: 20,
            child: CustomButton(
              text: 'Save',
              onTap: () {
                if (registerController.registerFormkey.currentState!
                    .validate()) {
                  generatePDF(
                    context,
                    name: registerController.nameController.text,
                    whatsapp: registerController.whatsappController.text,
                    address: registerController.addressController.text,
                    location: registerController.locationController.text,
                    branch: registerController.branchController.text,
                    treatment: registerController.treatmentController.text,
                    totalAmount: registerController.totalAmountController.text,
                    discountAmount:
                        registerController.discountAmountController.text,
                    advanceAmount:
                        registerController.advanceAmountController.text,
                    balanceAmount:
                        registerController.balanceAmountController.text,
                    starttime: registerController.starttimeController.text,
                    endtime: registerController.endtimeController.text,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
