import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer(
      {super.key,
      required this.contentName,
      required this.stringColor,
      required this.containerColor,
      required this.borderColor});
  final String contentName;
  final Color stringColor;
  final Color containerColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Text(
            contentName,
            style: GoogleFonts.poppins(fontSize: 12, color: stringColor),
          ),
        ),
      ),
    );
  }
}
