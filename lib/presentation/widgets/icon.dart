import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: screenWidth * 0.13,
          width: screenWidth * 0.13,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withAlpha(100), width: 0.7),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withAlpha(30),
            //     spreadRadius: 1,
            //     blurRadius: 10,
            //     offset: Offset(0, 0),
            //   ),
            // ],
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.01),
            child: Image.asset("assets/rhombus.png"),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
      ],
    );
  }
}
