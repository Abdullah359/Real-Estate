import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/components/login_content.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  List<String> tilesName = ['Login', 'Signup'];
  List<Widget> contents = [LoginContent(), SizedBox()];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                itemCount: tilesName.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _current = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 150,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: _current == index
                                ? Colors.transparent
                                : Colors.grey.shade300),
                        color: _current == index ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                        child: Text(
                          tilesName[index],
                          style: GoogleFonts.poppins(
                              color: _current == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(child: contents[_current])
          ],
        ),
      ),
    );
  }
}
