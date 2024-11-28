import 'package:ayur_care/screens/register_screen.dart';
import 'package:ayur_care/utils/app_colors.dart';
import 'package:ayur_care/utils/app_text_styles.dart';
import 'package:ayur_care/widgets/common/custom_appbar.dart';
import 'package:ayur_care/widgets/home/drop_down.dart';
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
                            height: 48,
                            width: 100,
                            //padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: Appcolor
                                  .buttonColor, // Button background color
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sort by:',
                          style: CustomTextStyle.buttonTextStyle,
                        ),
                        DropdownButtons(),
                      ],
                    ),
                    const Divider(),
                    // Cards in the body
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
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
