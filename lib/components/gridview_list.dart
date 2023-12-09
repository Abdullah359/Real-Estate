import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGridWidget extends StatefulWidget {
  const MyGridWidget({super.key});

  @override
  State<MyGridWidget> createState() => _MyGridWidgetState();
}

class _MyGridWidgetState extends State<MyGridWidget> {
  final List<String> names = [
    'New Listing',
    'New Project',
    'Open House',
    'Price Reduced',
  ];
  final List<String> imageURL = [
    'assets/images/houses/house_1.jpg',
    'assets/images/houses/house_2.jpg',
    'assets/images/houses/house_3.jpg',
    'assets/images/houses/house_4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: names.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 3 / 2.5),
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(imageURL[index]), fit: BoxFit.cover),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 3.5, sigmaX: 3.5),
              child: Center(
                child: Text(
                  names[index],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      shadows: [
                        const Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(3.0, 3.0),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
