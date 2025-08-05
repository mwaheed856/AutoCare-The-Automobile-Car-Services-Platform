import 'package:auto_care_project/HomePage.dart';
import 'package:auto_care_project/bottom_navigation_bar/MorePgae.dart';
import 'package:auto_care_project/bottom_navigation_bar/SavedPage.dart';

import 'package:auto_care_project/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../buy_cars/FilterCar.dart';
import '../chats/all_users_page.dart';
import '../menu/menu_page.dart';
import 'NotificationPage.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AllUsersPage(),
    SavedAdsScreen(),
    MorePage(),
    MenuPage(), // Replace with your actual MorePage widget

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the current page
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1, // Adjust height as needed
        decoration: BoxDecoration(
          //color: myColor.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: myColor.secondaryColor,
          currentIndex: _selectedIndex,
          onTap: (int newIndex) {
            setState(() {
              _selectedIndex = newIndex;
            });
          },
          selectedLabelStyle: TextStyle(
            color: myColor.secondaryColor,
            fontFamily: 'RobotoR',
            fontSize: 15,
          ),
          unselectedLabelStyle: TextStyle(color: myColor.secondaryColor),
          selectedItemColor: myColor.secondaryColor,
          unselectedItemColor: myColor.secondaryColor,
          selectedIconTheme:
          IconThemeData(color: myColor.secondaryColor, size: 28),
          unselectedIconTheme:
          IconThemeData(color: myColor.secondaryColor, size: 24),
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              activeIcon: Icon(CupertinoIcons.house_fill),
              label: "Home",
              backgroundColor: myColor.backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble),
              activeIcon: Icon(CupertinoIcons.chat_bubble_fill),
              label: "Chat",
              backgroundColor: myColor.backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.suit_heart),
              activeIcon: Icon(CupertinoIcons.heart_fill),
              label: "Saved",
              backgroundColor: myColor.backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.mail),
              activeIcon: Icon(CupertinoIcons.mail_solid),
              label: "Notifications",
              backgroundColor: myColor.backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.line_horizontal_3),
              label: "More",
              backgroundColor: myColor.backgroundColor,
            ),
          ],
          //onTap: _onItemTapped,
        ),
      ),
    );
  }
}


// Complete implementation of SellYourCarScreen with searchable bottom sheets for dropdowns



