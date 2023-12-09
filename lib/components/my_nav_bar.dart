import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int currentPageIndex = 0;
  static const List<Widget> kPages = [
    SizedBox(
      child: Center(
        child: Icon(Icons.ac_unit),
      ),
    ),
    SizedBox(
      child: Center(
        child: Icon(Icons.access_alarms),
      ),
    ),
    SizedBox(
      child: Center(
        child: Icon(Icons.access_time_filled_sharp),
      ),
    ),
    SizedBox(
      child: Center(
        child: Icon(Icons.account_balance),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              splashFactory: InkSplash.splashFactory),
          child: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              currentIndex: currentPageIndex,
              onTap: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              elevation: 0.0,
              backgroundColor: Colors.white,
              showUnselectedLabels: true,
              enableFeedback: false,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.w500),
              unselectedLabelStyle: GoogleFonts.poppins(),
              showSelectedLabels: true,
              fixedColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Colors.transparent,
                    activeIcon:
                        Image.asset('assets/images/icons/house.png', width: 32),
                    icon: Image.asset('assets/images/icons/house_disable.png',
                        width: 28),
                    label: 'Home'),
                BottomNavigationBarItem(
                    activeIcon:
                        Image.asset('assets/images/icons/mail.png', width: 32),
                    icon: Image.asset('assets/images/icons/mail_disable.png',
                        width: 28),
                    label: 'Inbox'),
                BottomNavigationBarItem(
                    activeIcon: Image.asset('assets/images/icons/checklist.png',
                        width: 32),
                    icon: Image.asset(
                        'assets/images/icons/checklist_disable.png',
                        width: 28),
                    label: 'Activity'),
                BottomNavigationBarItem(
                    activeIcon:
                        Image.asset('assets/images/icons/user.png', width: 32),
                    icon: Image.asset('assets/images/icons/user_disable.png',
                        width: 28),
                    label: 'Profile'),
              ],
            ),
          ),
        ),
        body: kPages[currentPageIndex],
      ),
    );
  }
}
