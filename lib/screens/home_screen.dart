import 'package:ayur_care/controller/api_controller.dart';
import 'package:ayur_care/model/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:ayur_care/screens/register_screen.dart';
import 'package:ayur_care/screens/widgets/utils/app_colors.dart';
import 'package:ayur_care/screens/widgets/utils/app_text_styles.dart';
import 'package:ayur_care/screens/widgets/common/custom_appbar.dart';
import 'package:ayur_care/screens/widgets/home/drop_down.dart';
import 'package:ayur_care/screens/widgets/home/homecard.dart';
import 'package:ayur_care/screens/widgets/login/custom_buttom.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiController = Provider.of<ApiController>(context);

    return Scaffold(
      backgroundColor: Appcolor.primaryColor,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search row
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                        ),
                        // Search button as a container
                        Container(
                            height: 48,
                            width: 100,
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: Appcolor.buttonColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'search',
                                  style:
                                      TextStyle(color: Appcolor.primaryColor),
                                ))),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sort by:',
                          style: CustomTextStyle.containerTextStyle,
                        ),
                        const DropdownButtons(),
                      ],
                    ),
                    const Divider(),
                    // Cards in the body with FutureBuilder
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: FutureBuilder<List<PatientModel>>(
                        future: apiController
                            .fetchPatientList(), // Fetching data using FutureBuilder
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Show a loading indicator while the data is being fetched
                            return Container(
                                height: 500,
                                child: Center(
                                    child: Text(
                                  'Loading....',
                                  style:
                                      CustomTextStyle.containersubTittlestyle,
                                )));
                          } else if (snapshot.hasError) {
                            // Show error message if there's an issue
                            return const Center(
                                child: Text("An error occurred"));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            // Show a message if no data is returned
                            return const Center(
                                child: Text("No data available"));
                          } else {
                            final patients = snapshot.data!;
                            return Column(
                              children: patients.map((patient) {
                                return Homecard(
                                  tittle: patient.name,
                                  content: patient.treatment,
                                  date: patient.date,
                                  user: patient.user,
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
          // Sticky button at the bottom
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: CustomButton(
              text: 'Register Now',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
