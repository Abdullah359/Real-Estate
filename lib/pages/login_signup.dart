import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/my_bottom_sheet.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/estate_bg.jpg'),
                fit: BoxFit.fitHeight),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: InkWell(
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: Colors.grey,
                  borderRadius: BorderRadius.circular(35),
                  child: Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (_) => const MyBottomSheet(),
                  );
                },
              ),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 10,
          child: Column(children: [
            Image.asset(
              'assets/images/logos/logo.png',
              height: 100,
            ),
            Text(
              'Nhome',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ]),
        ),
        Positioned(
          top: 250,
          left: 20,
          child: AnimatedTextKit(isRepeatingAnimation: false,animatedTexts: [
            TyperAnimatedText('Discover Your\nDream Home!',
                textStyle: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[100],
                    shadows: [
                      const Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(3.0, 3.0),
                      ),
                    ]),
                speed: const Duration(milliseconds: 150),
                textAlign: TextAlign.start),
          ]),
        ),
      ],
    );
  }
}
