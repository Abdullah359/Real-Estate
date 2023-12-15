import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/components/content_animate_container.dart';
import 'package:realestate/components/slider_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/category_model.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int _current = 0;
  int _roomCurrent = 0;
  int _bathCurrent = 0;
  int selectedOption = 0;
  bool _isBool1 = false;
  bool _isBool2 = false;
  bool _isBool3 = false;
  bool _isBool4 = false;
  final List<String> numCounts = [
    "1",
    "2",
    "3",
    "4+",
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Stack(children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                child: Column(children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50)),
                    child: Theme(
                      data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TabBar(
                            dragStartBehavior: DragStartBehavior.start,
                            physics: const NeverScrollableScrollPhysics(),
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: const [
                              TabsWidget(
                                title: 'For Rent',
                              ),
                              TabsWidget(
                                title: 'For Sale',
                              ),
                            ]),
                      ),
                    ),
                  ),
                  const MySliderChartWidget(),
                  const CustomDivider(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 5.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'House Type',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (ctx, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _current = index;
                          });
                        },
                        child: CustomAnimatedContainer(
                          contentName: categoryList[index].categoryName,
                          stringColor:
                              _current == index ? Colors.white : Colors.black,
                          containerColor:
                              _current == index ? Colors.black : Colors.white,
                          borderColor: _current == index
                              ? Colors.transparent
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const CustomDivider(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      bottom: 8,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Rooms',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 37,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: numCounts.length,
                      itemBuilder: (ctx, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _roomCurrent = index;
                          });
                        },
                        child: CustomAnimatedContainer(
                          contentName: numCounts[index],
                          stringColor: _roomCurrent == index
                              ? Colors.white
                              : Colors.black,
                          containerColor: _roomCurrent == index
                              ? Colors.black
                              : Colors.white,
                          borderColor: _roomCurrent == index
                              ? Colors.transparent
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const CustomDivider(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      bottom: 8,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Bathrooms',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 37,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: numCounts.length,
                      itemBuilder: (ctx, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _bathCurrent = index;
                          });
                        },
                        child: CustomAnimatedContainer(
                          contentName: numCounts[index],
                          stringColor: _bathCurrent == index
                              ? Colors.white
                              : Colors.black,
                          containerColor: _bathCurrent == index
                              ? Colors.black
                              : Colors.white,
                          borderColor: _bathCurrent == index
                              ? Colors.transparent
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const CustomDivider(),
                  CustomRowWidget(
                    startWidget: Text(
                      'Amenities',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    endWidget: Text(
                      'Show All',
                      style: GoogleFonts.poppins(color: Colors.grey.shade500),
                    ),
                  ),
                  CustomRowWidget(
                    startWidget: Text(
                      'Garage',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    endWidget: Checkbox(
                        activeColor: Colors.black,
                        shape: const CircleBorder(),
                        value: _isBool1,
                        onChanged: (isBool) {
                          setState(() {
                            _isBool1 = isBool!;
                          });
                        }),
                  ),
                  CustomRowWidget(
                    startWidget: Text(
                      'Wifi',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    endWidget: Checkbox(
                        activeColor: Colors.black,
                        shape: const CircleBorder(),
                        value: _isBool2,
                        onChanged: (isBool) {
                          setState(() {
                            _isBool2 = isBool!;
                          });
                        }),
                  ),
                  CustomRowWidget(
                    startWidget: Text(
                      'Pool',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    endWidget: Checkbox(
                        activeColor: Colors.black,
                        shape: const CircleBorder(),
                        value: _isBool3,
                        onChanged: (isBool) {
                          setState(() {
                            _isBool3 = isBool!;
                          });
                        }),
                  ),
                  CustomRowWidget(
                    startWidget: Text(
                      'Appliances',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    endWidget: Checkbox(
                        activeColor: Colors.black,
                        shape: const CircleBorder(),
                        value: _isBool4,
                        onChanged: (isBool) {
                          setState(() {
                            _isBool4 = isBool!;
                          });
                        }),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ]),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70,
                width: double.infinity,
                color: Colors.grey.shade50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IBWidget(
                        onPress: () {
                          Get.back();
                        },
                        iconWidget: const Icon(Icons.arrow_back_ios_new),
                      ),
                      Text(
                        "Filter Property",
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 17),
                      ),
                      IBWidget(
                        onPress: () {},
                        iconWidget: Image.asset("assets/images/icons/redo.png",
                            width: 20),
                      ),
                    ]),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.defaultDialog(
                          middleText: "Filter Saved", title: 'Filter');
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'Save Filter',
                          style: GoogleFonts.poppins(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class CustomRowWidget extends StatefulWidget {
  const CustomRowWidget({
    super.key,
    required this.startWidget,
    required this.endWidget,
  });
  final Widget startWidget;
  final Widget endWidget;

  @override
  State<CustomRowWidget> createState() => _CustomRowWidgetState();
}

class _CustomRowWidgetState extends State<CustomRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [widget.startWidget, widget.endWidget],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 50,
      thickness: 1,
      color: Colors.grey,
      indent: 10,
      endIndent: 10,
    );
  }
}

class IBWidget extends StatelessWidget {
  const IBWidget({
    super.key,
    required this.onPress,
    required this.iconWidget,
  });
  final void Function()? onPress;
  final Widget iconWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey)),
      child: IconButton(onPressed: onPress, icon: iconWidget),
    );
  }
}

class TabsWidget extends StatelessWidget {
  const TabsWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
