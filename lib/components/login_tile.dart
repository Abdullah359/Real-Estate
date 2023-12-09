import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTile extends StatelessWidget {
  const LoginTile(
      {super.key, required this.imageURL, required this.title, this.onPress});

  final String imageURL;
  final String title;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imageURL,
                  height: 30,
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  'Continue with $title',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
