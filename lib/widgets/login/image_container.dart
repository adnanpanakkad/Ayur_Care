import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, 
      children: [
        // Background image
        Image.asset(
          'assets/Frame 176.png',
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
        // Top center image
        const Positioned(
          top: 50, 
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            backgroundImage: AssetImage(
              'assets/Layer_1-2.png',
            ),
          ),
        ),
      ],
    );
  }
}
