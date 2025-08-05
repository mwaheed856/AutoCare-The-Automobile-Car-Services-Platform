// import 'package:auto_care_project/bottom_navigation_bar/NotificationPage.dart';
// import 'package:auto_care_project/sell_cars/SellCars.dart';
// import 'package:auto_care_project/buy_cars/buy_car.dart';
// import 'package:auto_care_project/colors.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'buy_cars/BuyCarsDetails.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int currentIndex = 0;
//   int selectedIndex = 0;
//   final user = FirebaseAuth.instance.currentUser;
//
//   signOut() async {
//     await FirebaseAuth.instance.signOut();
//   }
//   final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("post_your_ad");
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       // bottomNavigationBar: Container(
//       //   height: height * 0.1,
//       //   decoration: BoxDecoration(
//       //     // color:Colors.redAccent,
//       //     borderRadius: BorderRadius.only(
//       //       topLeft: Radius.circular(20), // Apply top-left border radius
//       //       topRight: Radius.circular(20), // Apply top-right border radius
//       //     ),
//       //   ),
//       //   child: BottomNavigationBar(
//       //     backgroundColor: myColor.secondaryColor,
//       //     currentIndex: currentIndex,
//       //     onTap: (int newIndex) {
//       //       setState(() {
//       //         currentIndex = newIndex;
//       //       });
//       //     },
//       //     selectedLabelStyle: TextStyle(
//       //       color: myColor.secondaryColor,
//       //       fontFamily: 'RobotoR',
//       //       fontSize: 15,
//       //     ),
//       //     unselectedLabelStyle: TextStyle(color: myColor.secondaryColor),
//       //     selectedItemColor: myColor.secondaryColor,
//       //     unselectedItemColor: myColor.secondaryColor,
//       //     selectedIconTheme:
//       //         IconThemeData(color: myColor.secondaryColor, size: 28),
//       //     unselectedIconTheme:
//       //         IconThemeData(color: myColor.secondaryColor, size: 24),
//       //     items: const <BottomNavigationBarItem>[
//       //       BottomNavigationBarItem(
//       //         //icon: Icon(Icons.favorite_border_outlined),
//       //         icon: Icon(CupertinoIcons.suit_heart),
//       //         activeIcon: Icon(CupertinoIcons.heart_fill),
//       //         label: "Saved",
//       //         backgroundColor: myColor.backgroundColor,
//       //       ),
//       //       BottomNavigationBarItem(
//       //         icon: Icon(CupertinoIcons.chat_bubble),
//       //         activeIcon: Icon(CupertinoIcons.chat_bubble_fill),
//       //         label: "Chat",
//       //         backgroundColor: myColor.backgroundColor,
//       //       ),
//       //       BottomNavigationBarItem(
//       //         icon: Icon(Icons.home_outlined),
//       //         activeIcon: Icon(Icons.home),
//       //         label: "Home",
//       //         backgroundColor: myColor.backgroundColor,
//       //       ),
//       //       BottomNavigationBarItem(
//       //         icon: Icon(Icons.notifications_none),
//       //         activeIcon: Icon(Icons.notifications),
//       //         label: "Notifications",
//       //         backgroundColor: myColor.backgroundColor,
//       //       ),
//       //       BottomNavigationBarItem(
//       //         icon: Icon(
//       //           Icons.menu,
//       //         ),
//       //         label: "More",
//       //         backgroundColor: myColor.backgroundColor,
//       //       )
//       //     ],
//       //   ),
//       // ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//               header(width: width, height: height),
//               Container(
//                   child: Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           "Browse by category",
//                           style: TextStyle(
//                             color: myColor.backgroundColor,
//                             fontFamily: 'RobotoM',
//                             fontSize: 25,
//                           ),
//                         )),
//                     Text(
//                       "Search used cars through specially curated categories",
//                       style: TextStyle(
//                         fontFamily: 'RobotoL',
//                         fontSize: 15,
//                       ),
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           BuildTextButton(
//                             text: "Body Type",
//                             onpressed: () {
//                               setState(() {
//                                 selectedIndex = 0;
//                               });
//                             },
//                             isSelected: selectedIndex == 0,
//                           ),
//                           BuildTextButton(
//                             text: "Brand",
//                             onpressed: () {
//                               setState(() {
//                                 selectedIndex = 1;
//                               });
//                             },
//                             isSelected: selectedIndex == 1,
//                           ),
//                           BuildTextButton(
//                             text: "Fuel Type",
//                             onpressed: () {
//                               setState(() {
//                                 selectedIndex = 2;
//                               });
//                             },
//                             isSelected: selectedIndex == 2,
//                           ),
//                           BuildTextButton(
//                             text: "Year",
//                             onpressed: () {
//                               setState(() {
//                                 selectedIndex = 3;
//                               });
//                             },
//                             isSelected: selectedIndex == 3,
//                           ),
//                           BuildTextButton(
//                             text: "Transimission",
//                             onpressed: () {
//                               setState(() {
//                                 selectedIndex = 4;
//                               });
//                             },
//                             isSelected: selectedIndex == 4,
//                           ),
//                         ],
//                       ),
//                     ),
//                     if (selectedIndex == 0)
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 CarCategoryCard(
//                                   title: "SUV",
//                                   imagePath: "assets/images/SUV_car.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Coupe",
//                                   imagePath: "assets/images/Coupe_car.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Convertible",
//                                   imagePath: "assets/images/Convertible_car.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Wagon",
//                                   imagePath: "assets/images/Wagon_car.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Truck",
//                                   imagePath: "assets/images/Truck_car.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Micro Van",
//                                   imagePath: "assets/images/Micro_van_car.png",
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             Row(
//                               children: [
//                                 CarCategoryCard(
//                                   title: "Sedan",
//                                   imagePath: "assets/images/Sedan_car.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Hatchback",
//                                   imagePath: "assets/images/Hatchback_car.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Crossover",
//                                   imagePath: "assets/images/Crossover_car.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "MVP",
//                                   imagePath: "assets/images/MVP_car.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Mini van",
//                                   imagePath: "assets/images/Mini_van_car.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Other",
//                                   imagePath: "assets/images/Mini_van_car.png",
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     if (selectedIndex == 1)
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 CarCategoryCard(
//                                   title: "Honda",
//                                   imagePath: "assets/images/Honda_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Hyundai",
//                                   imagePath: "assets/images/Hyundai_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Audi",
//                                   imagePath: "assets/images/Audi_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "BMW",
//                                   imagePath: "assets/images/BMW_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Suzuki",
//                                   imagePath: "assets/images/Suzuki_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Toyota",
//                                   imagePath: "assets/images/Toyota_logo.png",
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             Row(
//                               children: [
//                                 CarCategoryCard(
//                                   title: "Changan",
//                                   imagePath: "assets/images/Changan_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Daihatsu",
//                                   imagePath: "assets/images/Daihatsu_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "KIA",
//                                   imagePath: "assets/images/KIA_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Mercedez",
//                                   imagePath: "assets/images/Mercedez_Benz_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Mitsubishi",
//                                   imagePath: "assets/images/Mitsubishi_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Nissan",
//                                   imagePath: "assets/images/Nissan_logo.png",
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     if (selectedIndex == 2)
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 CarCategoryCard(
//                                   title: "Petrol",
//                                   imagePath: "assets/images/Petrol_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Hybrid",
//                                   imagePath: "assets/images/Hybrid_logo.png",
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             Row(
//                               children: [
//                                 CarCategoryCard(
//                                   title: "Disel",
//                                   imagePath: "assets/images/Hybrid_logo.png",
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 CarCategoryCard(
//                                   title: "Electric",
//                                   imagePath: "assets/images/Hybrid_logo.png",
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     if (selectedIndex == 3)
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "2015",
//                                 style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: width * 0.15,
//                               ),
//                               Text(
//                                 "2016",
//                                 style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: width * 0.15,
//                               ),
//                               Text(
//                                 "2017",
//                                 style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: height * 0.015,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "2018",
//                                 style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: width * 0.15,
//                               ),
//                               Text(
//                                 "2019",
//                                 style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: width * 0.15,
//                               ),
//                               Text(
//                                 "2020",
//                                 style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: height * 0.015,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "2021",
//                                 style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: width * 0.15,
//                               ),
//                               Text(
//                                 "2022",
//                                 style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: width * 0.15,
//                               ),
//                               Text(
//                                 "2023",
//                                 style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: height * 0.015,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "2024",
//                                 style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     if (selectedIndex == 4)
//                       Column(
//                         children: [
//                           Row(
//                             children: [
//                               CarCategoryCard(
//                                 title: "Automatic",
//                                 imagePath: "assets/images/Automatic_car.png",
//                               ),
//                               SizedBox(
//                                 width: width * 0.02,
//                               ),
//                               CarCategoryCard(
//                                 title: "Hybrid",
//                                 imagePath: "assets/images/Automatic_car.png",
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: height * 0.01,
//                           ),
//                           Row(
//                             children: [
//                               CarCategoryCard(
//                                 title: "Manual",
//                                 imagePath: "assets/images/Automatic_car.png",
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               )),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                           color: Colors.blueGrey.shade50, // Shadow color
//                           blurRadius: 15.0, // Spread of shadow
//                           offset: const Offset(0.0, 0.75), // Position of shadow
//                         ),
//                       ],
//                       border: Border.all(color: myColor.backgroundColor)
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15, right: 15 , top: 10, bottom: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             color: myColor.greyColor,
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: <BoxShadow>[
//                               BoxShadow(
//                                 color: Colors.blueGrey.shade50, // Shadow color
//                                 blurRadius: 15.0, // Spread of shadow
//                                 offset: const Offset(0.0, 0.75), // Position of shadow
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               const Padding(
//                                 padding: EdgeInsets.only(left: 15, right: 15, top: 10),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(CupertinoIcons.heart_fill),
//                                     Icon(CupertinoIcons.heart),
//                                   ],
//                                 ),
//                               ),
//                               Image.asset("assets/images/Coupe_car.png", height: height * 0.25, width: width * 1,)
//                             ],
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: myColor.backgroundColor,
//                                 borderRadius: BorderRadius.circular(15),
//                                 boxShadow: <BoxShadow>[
//                                   BoxShadow(
//                                     color: Colors.blueGrey.shade50, // Shadow color
//                                     blurRadius: 15.0, // Spread of shadow
//                                     offset: const Offset(0.0, 0.75), // Position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   'Sedan',
//                                   style: TextStyle(
//                                     fontFamily: 'RobotoR',
//                                     fontSize: 20,
//                                     color: myColor.secondaryColor,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               '500K',
//                               style: TextStyle(
//                                 fontFamily: 'RobotoR',
//                                 fontSize: 20,
//                                 color: myColor.textColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text("Mercedes-Benz",style: TextStyle(
//                             fontSize: 25,
//                             fontFamily: "RobotoM",
//                             color: myColor.textColor
//                         ),),
//                         Divider(),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(CupertinoIcons.map),
//                                 SizedBox(width: 5),
//                                 Text(
//                                   "Manual",
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: "RobotoR",
//                                     color: myColor.backgroundColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Icon(CupertinoIcons.arrow_swap),
//                                 SizedBox(width: 5),
//                                 Text(
//                                   "Petrol",
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: "RobotoR",
//                                     color: myColor.backgroundColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Icon(CupertinoIcons.person_2_fill),
//                                 SizedBox(width: 5),
//                                 Text(
//                                   "Person",
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: "RobotoR",
//                                     color: myColor.backgroundColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Text("data"),
//               BuyCars(),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (() => signOut()),
//         child: Icon(CupertinoIcons.lock),
//       ),
//     );
//   }
// }


import 'package:auto_care_project/CarServices/ServicesPage.dart';
import 'package:auto_care_project/bottom_navigation_bar/NotificationPage.dart';
import 'package:auto_care_project/predict_price/predict_price.dart';
import 'package:auto_care_project/sell_cars/SellCars.dart';
import 'package:auto_care_project/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'buy_cars/BuyCarsDetails.dart';
import 'buy_cars/FilterCar.dart';
import 'buy_cars/buy_car.dart';
import 'package:firebase_database/firebase_database.dart';

import 'chatbot/chat_screen.dart';


// import 'buy_cars/FilterCar.dart'; // Ensure correct import for BuyCars

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser;

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            header(width: width, height: height),  // Assuming header() is defined elsewhere
            Container(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Browse by category",
                          style: TextStyle(
                            color: myColor.backgroundColor,
                            fontFamily: 'RobotoM',
                            fontSize: 25,
                          ),
                        )),
                    Text(
                      "Search used cars through specially curated categories",
                      style: TextStyle(
                        fontFamily: 'RobotoL',
                        fontSize: 15,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BuildTextButton(
                            text: "Brand",
                            onpressed: () {
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                            isSelected: selectedIndex == 0,
                          ),
                          BuildTextButton(
                            text: "Model",
                            onpressed: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                            isSelected: selectedIndex == 1,
                          ),
                          BuildTextButton(
                            text: "City",
                            onpressed: () {
                              setState(() {
                                selectedIndex = 2;
                              });
                            },
                            isSelected: selectedIndex == 2,
                          ),
                          BuildTextButton(
                            text: "Fuel Type",
                            onpressed: () {
                              setState(() {
                                selectedIndex = 3;
                              });
                            },
                            isSelected: selectedIndex == 3,
                          ),
                          BuildTextButton(
                            text: "Transimission",
                            onpressed: () {
                              setState(() {
                                selectedIndex = 4;
                              });
                            },
                            isSelected: selectedIndex == 4,
                          ),
                        ],
                      ),
                    ),
                    if (selectedIndex == 0)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CarCategoryCard(
                                  title: "Honda",
                                  imagePath: "assets/images/Honda_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Honda", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Hyundai",
                                  imagePath: "assets/images/Hyundai_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Hyundai", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Audi",
                                  imagePath: "assets/images/Audi_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Audi", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "BMW",
                                  imagePath: "assets/images/BMW_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "BMW",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Suzuki",
                                  imagePath: "assets/images/Suzuki_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Suzuki",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Toyota",
                                  imagePath: "assets/images/Toyota_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Toyota",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                CarCategoryCard(
                                  title: "Changan",
                                  imagePath: "assets/images/Changan_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Changan",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Daihatsu",
                                  imagePath: "assets/images/Daihatsu_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Daihatsu",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Kia",
                                  imagePath: "assets/images/KIA_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Kia",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Mercedes",
                                  imagePath: "assets/images/Mercedez_Benz_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Mercedes-Benz",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Mitsubishi",
                                  imagePath: "assets/images/Mitsubishi_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Mitsubishi",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Nissan",
                                  imagePath: "assets/images/Nissan_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Nissan",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    if (selectedIndex == 1)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CarCategoryCard(
                                  title: "Civic",
                                  imagePath: "assets/images/Honda_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Honda",
                                            "carModel": "Civic",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "City",
                                  imagePath: "assets/images/Honda_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Honda",
                                            "carModel": "City", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Elantra",
                                  imagePath: "assets/images/Hyundai_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Hyundai", // ✅ include the brand
                                            "carModel": "Elantra", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Sonata",
                                  imagePath: "assets/images/Hyundai_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Hyundai",
                                            "carModel": "Sonata", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Corolla (XLi)",
                                  imagePath: "assets/images/Toyota_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Toyota",
                                            "carModel": "Corolla (XLi)", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Corolla (GLi)",
                                  imagePath: "assets/images/Toyota_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Toyota",
                                            "carModel": "Corolla (GLi)", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                CarCategoryCard(
                                  title: "Alto",
                                  imagePath: "assets/images/Suzuki_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Suzuki",
                                            "carModel": "Alto", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Cultus",
                                  imagePath: "assets/images/Suzuki_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Suzuki",
                                            "carModel": "Cultus", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Swift",
                                  imagePath: "assets/images/Suzuki_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Suzuki",
                                            "carModel": "Swift", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Wagon R",
                                  imagePath: "assets/images/Suzuki_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Suzuki",
                                            "carModel": "Wagon R", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Corolla (Altis)",
                                  imagePath: "assets/images/Toyota_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Toyota",
                                            "carModel": "Corolla (Altis)", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Corolla (Grande)",
                                  imagePath: "assets/images/Toyota_logo.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "carBrand": "Toyota",
                                            "carModel": "Corolla (Grande)", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    if (selectedIndex == 2)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CarCategoryCard(
                                  title: "Lahore",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Lahore", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Karachi",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Karachi", // 👈 this activates your filter logic
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Multan",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Multan",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Rawalpindi",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Rawalpindi",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Faisalabad",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Faisalabad",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Sialkot",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Sialkot",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                CarCategoryCard(
                                  title: "Hyderabad",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Hyderabad",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Quetta",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Quetta",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Gwadar",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Gwadar",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Peshawar",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Peshawar",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Bahawalpur",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Bahawalpur",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                CarCategoryCard(
                                  title: "Mianwali",
                                  imagePath: "assets/images/location.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostYourAd(
                                          filters: {
                                            "location": "Mianwali",
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    if (selectedIndex == 3)
                      Column(
                        children: [
                          Row(
                            children: [
                              CarCategoryCard(
                                title: "petrol",
                                imagePath: "assets/images/Automatic_car.png",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PostYourAd(
                                        filters: {
                                          "fuelType": "petrol",
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              CarCategoryCard(
                                title: "hybrid",
                                imagePath: "assets/images/Automatic_car.png",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PostYourAd(
                                        filters: {
                                          "fuelType": "hybrid", // 👈 this activates your filter logic
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    if (selectedIndex == 4)
                      Column(
                        children: [
                          Row(
                            children: [
                              CarCategoryCard(
                                title: "Automatic",
                                imagePath: "assets/images/Automatic_car.png",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PostYourAd(
                                        filters: {
                                          "transmission": "Automatic", // 👈 this activates your filter logic
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              CarCategoryCard(
                                title: "Manual",
                                imagePath: "assets/images/Automatic_car.png",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PostYourAd(
                                        filters: {
                                          "transmission": "Manual", // 👈 this activates your filter logic
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              )),
            SizedBox(height: 10),
            Expanded(
              child: PostYourAd(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GeminiChatScreen(

              ),
            ),
          );
          // GeminiChatScreen();
        } ,
        child: Icon(CupertinoIcons.lock),
      ),
    );
  }
}

class header extends StatelessWidget {
  const header({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: width * 0.4,
                    height: height * 0.08,
                  )),
              Center(
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'RobotoM',
                      fontSize: 25,
                      color: myColor.secondaryColor),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              TextFormField(
                style: TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 16, // Text size
                  fontWeight: FontWeight.w500, // Text weight
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search',
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: myColor.backgroundColor,
                    size: 26,
                  ),
                  hintStyle: TextStyle(
                      color: myColor.backgroundColor, // Hint text color
                      fontSize: 15, // Hint text size
                      fontFamily: 'RobotoL' // Hint text style
                      ),
                  fillColor: myColor.secondaryColor, // Background color
                  filled: true, // Enable the background color
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      icon: Icon(CupertinoIcons.car),
                      text: "Sell Car",
                      color: myColor.secondaryColor,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SellCars()), // Navigate to SellCars screen
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Expanded(
                    child: Button(
                      icon: Icon(CupertinoIcons.car),
                      text: "Buy Car",
                      color: myColor.secondaryColor,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BuyCarsPage()), // Navigate to SellCars screen
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      icon: Icon(CupertinoIcons.car),
                      text: "Services",
                      color: myColor.secondaryColor,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ServicesPage()), // Navigate to SellCars screen
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Expanded(
                    child: Button(
                      icon: Icon(CupertinoIcons.car),
                      text: "Predict",
                      color: myColor.secondaryColor,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PredictCarPrice()), // Navigate to SellCars screen
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2.0,
                color: myColor.secondaryColor,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ));
  }
}

class Button extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color color;
  final VoidCallback onpressed;
  const Button({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: myColor.secondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onpressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: width * 0.02),
          Text(text,
              style: TextStyle(
                fontFamily: 'RobotoM',
                color: myColor.backgroundColor,
                fontSize: 20,
              )),
        ],
      ),
    );
  }
}

class BuildTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  final bool isSelected;

  const BuildTextButton({
    super.key,
    required this.text,
    required this.onpressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoR',
          fontSize: 20,
          color: isSelected
              ? myColor.backgroundColor
              : myColor.textColor,
          fontWeight: isSelected
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }
}

class CarCategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap; // 👈 New

  const CarCategoryCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onTap, // 👈 New
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // 👈 Make whole card tappable
      onTap: onTap,
      child: Container(
        height: 85,
        width: 100,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blueGrey.shade50,
              blurRadius: 15.0,
              offset: const Offset(0.0, 0.75),
            ),
          ],
          color: myColor.secondaryColor,
          border: Border.all(width: 2, color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'RobotoR',
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 105,
              child: Image.asset(imagePath),
            ),
          ],
        ),
      ),
    );
  }
}


















class PostYourAd extends StatefulWidget {
  final Map<String, dynamic>? filters; // ✅ Accept filters

  const PostYourAd({Key? key, this.filters}) : super(key: key);

  @override
  State<PostYourAd> createState() => _PostYourAdState();
}

class _PostYourAdState extends State<PostYourAd> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("post_your_ad");

  // ✅ Filter matching logic
  bool _matchesFilters(Map adData) {
    final filters = widget.filters;
    if (filters == null) return true;

    bool match(String key) {
      return filters[key] == null || filters[key].toString().isEmpty || (adData[key]?.toString().toLowerCase() == filters[key].toString().toLowerCase());
    }

    bool matchBudget() {
      if (filters["budget"] == null) return true;
      final price = int.tryParse(adData["price"].toString()) ?? 0;
      return price <= (filters["budget"] as int);
    }

    bool matchYear() {
      return filters["year"] == null || adData["year"].toString() == filters["year"].toString();
    }

    return match("carBrand") &&
        match("location") &&
        match("transmission") &&
        match("carType") &&
        match("bodyColor") &&
        matchBudget() &&
        matchYear();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: StreamBuilder(
        stream: databaseRef.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return const Center(child: Text("No ads available"));
          }

          final value = snapshot.data!.snapshot.value;
          if (value is! Map<dynamic, dynamic>) {
            return const Center(child: Text("Unexpected data format"));
          }

          Map<dynamic, dynamic> ads = value;
          List<MapEntry<dynamic, dynamic>> adList = ads.entries
              .where((e) => _matchesFilters(e.value))
              .toList();

          if (adList.isEmpty) {
            return const Center(child: Text("No matching ads found."));
          }

          return ListView.builder(
            itemCount: adList.length,
            itemBuilder: (context, index) {
              Map adData = adList[index].value;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuyCarDetails(
                        imageUrl: adData["imageUrl"] ?? "",
                        carBrand: adData["carBrand"] ?? "No Brand",
                        carModel: adData["carModel"] ?? "No Model",
                        price: "${adData["price"] ?? "N/A"}",
                        location: "${adData["location"] ?? "Unknown"}",
                        registeredIn: "${adData["registeredIn"] ?? "Unknown"}",
                        bodyColor: "${adData["bodyColor"] ?? "N/A"}",
                        kmsDriven: "${adData["kmsDriven"] ?? "0"}",
                        fuelType: "${adData["fuelType"] ?? "Unknown"}",
                        engineCapacity: "${adData["engineCapacity"] ?? "N/A"}",
                        transmission: "${adData["transmission"] ?? "N/A"}",
                        assembly: "${adData["assembly"] ?? "Unknown"}",
                        tradeInOption: "${adData["Allowed"] ?? "Unknown"}",
                        name: "${adData["name"] ?? "Unknown"}",
                        mobileNumber: "Mobile: ${adData["mobileNumber"] ?? "N/A"}",
                        description: "${adData["description"] ?? "No description available"}",
                        selectedFeatures: (adData["selectedFeatures"] as Map<dynamic, dynamic>?)
                            ?.map((key, value) => MapEntry(key.toString(), value as bool)) ??
                            {},
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.shade50,
                        blurRadius: 15.0,
                        offset: const Offset(0.0, 0.75),
                      ),
                    ],
                    border: Border.all(color: myColor.backgroundColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image.asset("assets/images/Coupe_car.png", height: height * 0.25, width: width),
                        Image.network(
                          adData["imageUrl"] ?? "https://via.placeholder.com/150", // Fallback image
                          height: height * 0.25,
                          width: width,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(child: CircularProgressIndicator());
                          },
                        ),

                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: myColor.backgroundColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.blueGrey.shade50, // Shadow color
                                    blurRadius: 15.0, // Spread of shadow
                                    offset: const Offset(0.0, 0.75), // Position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  adData["carBrand"] ?? "No Brand",
                                  style: TextStyle(
                                    fontFamily: 'RobotoR',
                                    fontSize: 20,
                                    color: myColor.secondaryColor,
                                  ),
                                ),
                              ),
                            ),
                            // Text(
                            //   "${adData["price"] ?? "N/A"}",
                            //   style: TextStyle(
                            //     fontFamily: 'RobotoM',
                            //     fontSize: 20,
                            //     color: myColor.textColor,
                            //   ),
                            // ),
                            // Text(adData["carBrand"] ?? "No Brand",
                            //     style: TextStyle(fontSize: 20, color: myColor.secondaryColor)),
                            Text("PKR: ${adData["price"] ?? "N/A"}",
                              style: TextStyle(
                                fontFamily: 'RobotoR',
                                fontSize: 17,
                                color: myColor.textColor,
                              ),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(adData["carModel"] ?? "No Model",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "RobotoM",
                                  color: myColor.textColor
                              ),),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Trade In Option"),
                                SizedBox(width: 5),
                                Text(
                                  "${adData["tradeInOption"]}",
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: "RobotoM",
                                    color: myColor.backgroundColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //spacing: 200,
                          children: [
                            _iconText(CupertinoIcons.map, adData["transmission"]),
                            _iconText(CupertinoIcons.arrow_swap, adData["fuelType"]),
                            _iconText(CupertinoIcons.location, adData["location"]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _iconText(IconData icon, String? text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: myColor.backgroundColor),
        const SizedBox(width: 5),
        Text(
          text ?? "N/A",
          style: TextStyle(fontSize: 16, color: myColor.backgroundColor),
        ),
      ],
    );
  }
}
