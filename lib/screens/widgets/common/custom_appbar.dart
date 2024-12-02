import 'package:ayur_care/screens/home_screen.dart';
import 'package:ayur_care/screens/widgets/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: Appcolor.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        ),
        // Right side icons
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
            onPressed: () {
              // Handle notifications icon press
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Standard AppBar height
}
