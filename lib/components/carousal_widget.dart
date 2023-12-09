import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCarousalWidget extends StatefulWidget {
  const MyCarousalWidget({super.key});

  @override
  State<MyCarousalWidget> createState() => _MyCarousalWidgetState();
}

class _MyCarousalWidgetState extends State<MyCarousalWidget> {
  static List<String> imageData = [
    "assets/images/houses/house_1.jpg",
    "assets/images/houses/house_2.jpg",
    "assets/images/houses/house_3.jpg",
    "assets/images/houses/house_4.jpg",
  ];
  static List<String> address = [
    "3839 Atha Drive, Los Angeles",
    "2263 Calvin Street, Baltimore",
    "1743 Round Table Drive, Orlando",
    "4199 Rockford Mountain Lane, Appleton",
  ];
  static List<String> prices = [
    "440,000",
    "470,000",
    "390,000",
    "760,000",
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    return SizedBox(
      child: CarouselSlider(
        carouselController: carouselController,
        items: imageData.map(
          (imagePath) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        "assets/images/logos/error.png",
                        height: 20,
                        width: 20,
                      );
                    },
                  ),
                  Text(
                    "\$${prices[_current]}",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    address[_current],
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        ).toList(),
        options: CarouselOptions(
            viewportFraction: 0.85,
            height: MediaQuery.of(context).size.height * .40,
            autoPlay: true,
            enlargeCenterPage: true,
            reverse: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
    );
  }
}
