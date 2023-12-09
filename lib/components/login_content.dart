import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/components/my_nav_bar.dart';

import 'login_tile.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(children: [
          const Expanded(
            child: Divider(
              color: Colors.grey,
              height: 20,
              thickness: 1.5,
            ),
          ),
          Text(
            '  or Login with  ',
            style:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1.5,
            ),
          ),
        ]),
      ),
      const SizedBox(
        height: 20,
      ),
      LoginTile(
        imageURL: 'assets/images/logos/google_icon.png',
        title: 'Google',
        onPress: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const MyNavBar()),
              (route) => false);
        },
      ),
      const LoginTile(
        imageURL: 'assets/images/logos/facebook_icon.png',
        title: 'Facebook',
      ),
      const LoginTile(
        imageURL: 'assets/images/logos/apple_icon.png',
        title: 'Apple',
      ),
    ]);
  }
}
