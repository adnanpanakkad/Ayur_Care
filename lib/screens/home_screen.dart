import 'package:ayur_care/screens/register_screen.dart';
import 'package:ayur_care/utils/app_colors.dart';
import 'package:ayur_care/widgets/common/custom_appbar.dart';
import 'package:ayur_care/widgets/home/homecard.dart';
import 'package:ayur_care/widgets/login/custom_buttom.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primaryColor,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          // Main content with scrollable area
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
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color:
                                Appcolor.buttonColor, // Button background color
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                          child: GestureDetector(
                            onTap: () {
                              // Handle search action here
                            },
                            child: const Icon(
                              Icons.search,
                              color: Colors.white, // Icon color
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Cards in the body
                    const Column(
                      children: [
                        Homecard(
                          date: '12.10.2003',
                          time: 'jithesh',
                          tittle: '1.vivekh',
                          content: 'couplecombo package',
                        ),
                        Homecard(
                          date: '13.10.2003',
                          time: 'arun',
                          tittle: '2.manish',
                          content: 'familycombo package',
                        ),
                      ],
                    ),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
