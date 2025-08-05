// import 'package:auto_care_project/HomePage.dart';
// import 'package:auto_care_project/buy_cars/BuyCarsDetails.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import '../bottom_navigation_bar/NotificationPage.dart';
// import '../colors.dart';
//
// class BuyCars extends StatefulWidget {
//   const BuyCars({super.key});
//
//   @override
//   State<BuyCars> createState() => _BuyCarsState();
// }
//
// class _BuyCarsState extends State<BuyCars> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             "Buy Cars",
//             style: TextStyle(
//               fontSize: 30,
//               fontFamily: 'RobotoM',
//               color: myColor.secondaryColor,
//             ),
//           ),
//         ),
//         backgroundColor: myColor.backgroundColor,
//       ),
//       backgroundColor: myColor.secondaryColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // AdsListScreen(),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                   boxShadow: <BoxShadow>[
//                     BoxShadow(
//                       color: Colors.blueGrey.shade50, // Shadow color
//                       blurRadius: 15.0, // Spread of shadow
//                       offset: const Offset(0.0, 0.75), // Position of shadow
//                     ),
//                   ],
//                   color: myColor.secondaryColor, // Background color
//                   borderRadius: BorderRadius.circular(10), // Rounded corners
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       left: 20, right: 20, top: 10, bottom: 10),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 20,
//                         ),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Text("Type",
//                                   style: TextStyle(
//                                     fontFamily: 'RobotoR',
//                                     fontSize: 20,
//                                   )),
//                             ),
//                             Expanded(
//                               child: Text("Brand",
//                                   style: TextStyle(
//                                     fontFamily: 'RobotoR',
//                                     fontSize: 20,
//                                   )),
//                             ),
//                             Expanded(
//                               child: Text("Year",
//                                   style: TextStyle(
//                                     fontFamily: 'RobotoR',
//                                     fontSize: 20,
//                                   )),
//                             ),
//                             Expanded(
//                               child: Text("Budget",
//                                   style: TextStyle(
//                                     fontFamily: 'RobotoR',
//                                     fontSize: 20,
//                                   )),
//                             ),
//                             Expanded(
//                               child: Text("Paint",
//                                   style: TextStyle(
//                                     fontFamily: 'RobotoR',
//                                     fontSize: 20,
//                                   )),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Row(
//                         spacing: 10,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 boxShadow: <BoxShadow>[
//                                   BoxShadow(
//                                     blurRadius: 5.0, // Spread of shadow
//                                     offset: const Offset(
//                                         0.0, 0.75), // Position of shadow
//                                   ),
//                                 ],
//                                 color:
//                                     myColor.backgroundColor, // Background color
//                                 border: Border.all(
//                                   width: 2, // Border width
//                                   color:
//                                       myColor.backgroundColor, // No border color
//                                 ),
//                                 borderRadius:
//                                     BorderRadius.circular(10), // Rounded corners
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: SizedBox(
//                                   height: height * 0.33,
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       children: [
//                                         BuyCarCategoryCard(
//                                           title: "SUV",
//                                           imagePath: "assets/images/SUV_car.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Coupe",
//                                           imagePath:
//                                               "assets/images/Coupe_car.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Convertible",
//                                           imagePath:
//                                               "assets/images/Convertible_car.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Wagon",
//                                           imagePath:
//                                               "assets/images/Wagon_car.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Truck",
//                                           imagePath:
//                                               "assets/images/Truck_car.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Micro Van",
//                                           imagePath:
//                                               "assets/images/Micro_van_car.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Sedan",
//                                           imagePath:
//                                               "assets/images/Sedan_car.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Hatchback",
//                                           imagePath:
//                                               "assets/images/Hatchback_car.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Crossover",
//                                           imagePath:
//                                               "assets/images/Crossover_car.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "MVP",
//                                           imagePath: "assets/images/MVP_car.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Mini van",
//                                           imagePath:
//                                               "assets/images/Mini_van_car.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Other",
//                                           imagePath:
//                                               "assets/images/Mini_van_car.png",
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 boxShadow: <BoxShadow>[
//                                   BoxShadow(
//                                     blurRadius: 5.0, // Spread of shadow
//                                     offset: const Offset(
//                                         0.0, 0.75), // Position of shadow
//                                   ),
//                                 ],
//                                 color:
//                                     myColor.backgroundColor, // Background color
//                                 border: Border.all(
//                                   width: 2, // Border width
//                                   color:
//                                       myColor.backgroundColor, // No border color
//                                 ),
//                                 borderRadius:
//                                     BorderRadius.circular(10), // Rounded corners
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: SizedBox(
//                                   height: height * 0.33,
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       children: [
//                                         BuyCarCategoryCard(
//                                           title: "Honda",
//                                           imagePath:
//                                               "assets/images/Honda_logo.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Hyundai",
//                                           imagePath:
//                                               "assets/images/Hyundai_logo.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Audi",
//                                           imagePath:
//                                               "assets/images/Audi_logo.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "BMW",
//                                           imagePath: "assets/images/BMW_logo.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Suzuki",
//                                           imagePath:
//                                               "assets/images/Suzuki_logo.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Toyota",
//                                           imagePath:
//                                               "assets/images/Toyota_logo.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Changan",
//                                           imagePath:
//                                               "assets/images/Changan_logo.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Daihatsu",
//                                           imagePath:
//                                               "assets/images/Daihatsu_logo.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "KIA",
//                                           imagePath: "assets/images/KIA_logo.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Mercedez",
//                                           imagePath:
//                                               "assets/images/Mercedez_Benz_logo.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Mitsubishi",
//                                           imagePath:
//                                               "assets/images/Mitsubishi_logo.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Nissan",
//                                           imagePath:
//                                               "assets/images/Nissan_logo.png",
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 boxShadow: <BoxShadow>[
//                                   BoxShadow(
//                                     blurRadius: 5.0, // Spread of shadow
//                                     offset: const Offset(
//                                         0.0, 0.75), // Position of shadow
//                                   ),
//                                 ],
//                                 color:
//                                     myColor.backgroundColor, // Background color
//                                 border: Border.all(
//                                   width: 2, // Border width
//                                   color:
//                                       myColor.backgroundColor, // No border color
//                                 ),
//                                 borderRadius:
//                                     BorderRadius.circular(10), // Rounded corners
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: SizedBox(
//                                   height: height * 0.33,
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       children: [
//                                         BuyCarCategoryCard(
//                                           title: "2013",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "2014",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "2015",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "2016",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "2017",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "2018",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "2019",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "2020",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "2021",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "2022",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "2023",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "2024",
//                                           imagePath:
//                                               "assets/images/year_icon.png",
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 boxShadow: <BoxShadow>[
//                                   BoxShadow(
//                                     blurRadius: 5.0, // Spread of shadow
//                                     offset: const Offset(
//                                         0.0, 0.75), // Position of shadow
//                                   ),
//                                 ],
//                                 color:
//                                     myColor.backgroundColor, // Background color
//                                 border: Border.all(
//                                   width: 2, // Border width
//                                   color:
//                                       myColor.backgroundColor, // No border color
//                                 ),
//                                 borderRadius:
//                                     BorderRadius.circular(10), // Rounded corners
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: SizedBox(
//                                   height: height * 0.33,
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       children: [
//                                         BuyCarCategoryCard(
//                                           title: "50 Lac",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "60 Lac",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "70 Lac",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "80 Lac",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "90 Lac",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "1 Crore",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "5 Crore",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "10 Crore",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "15 Crore",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "20 Crore",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "30 Crore",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "40 Crore",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "50 Crore",
//                                           imagePath:
//                                               "assets/images/budget_icon.png",
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 boxShadow: <BoxShadow>[
//                                   BoxShadow(
//                                     blurRadius: 5.0, // Spread of shadow
//                                     offset: const Offset(
//                                         0.0, 0.75), // Position of shadow
//                                   ),
//                                 ],
//                                 color:
//                                     myColor.backgroundColor, // Background color
//                                 border: Border.all(
//                                   width: 2, // Border width
//                                   color:
//                                       myColor.backgroundColor, // No border color
//                                 ),
//                                 borderRadius:
//                                     BorderRadius.circular(10), // Rounded corners
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: SizedBox(
//                                   height: height * 0.33,
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       children: [
//                                         BuyCarCategoryCard(
//                                           title: "Blue",
//                                           imagePath:
//                                               "assets/images/black_color.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Brown",
//                                           imagePath:
//                                               "assets/images/brown_color.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Green",
//                                           imagePath:
//                                               "assets/images/green_color.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Orange",
//                                           imagePath:
//                                               "assets/images/orange_color.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Pink",
//                                           imagePath:
//                                               "assets/images/pink_color.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Purple",
//                                           imagePath:
//                                               "assets/images/purple_color.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Red",
//                                           imagePath:
//                                               "assets/images/red_color.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "White",
//                                           imagePath:
//                                               "assets/images/white_color.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Yellow",
//                                           imagePath:
//                                               "assets/images/yellow_color.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Indigo",
//                                           imagePath:
//                                               "assets/images/indigo_color.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Black",
//                                           imagePath:
//                                               "assets/images/black_color.png",
//                                         ),
//                                         BuyCarCategoryCard(
//                                           title: "Grey",
//                                           imagePath:
//                                               "assets/images/grey_color.png",
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Row(
//                 spacing: 15,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: <BoxShadow>[
//                             BoxShadow(
//                               color: Colors.blueGrey.shade50, // Shadow color
//                               blurRadius: 15.0, // Spread of shadow
//                               offset: const Offset(0.0, 0.75), // Position of shadow
//                             ),
//                           ],
//                           border: Border.all(color: myColor.backgroundColor)
//                       ),
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         child: Expanded(
//                           child: Text(
//                             'Filter Apply',
//                             style: TextStyle(
//                               fontFamily: 'RobotoR',
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: myColor.backgroundColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         boxShadow: <BoxShadow>[
//                           BoxShadow(
//                             color: Colors.blueGrey.shade50, // Shadow color
//                             blurRadius: 15.0, // Spread of shadow
//                             offset: const Offset(0.0, 0.75), // Position of shadow
//                           ),
//                         ],
//                         border: Border.all(color: myColor.backgroundColor)
//                       ),
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         child: Expanded(
//                           child: Text(
//                             'Clear',
//                             style: TextStyle(
//                               fontFamily: 'RobotoR',
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: myColor.backgroundColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//             //   child: GestureDetector(
//             //     onTap: (){
//             //       Navigator.push(
//             //         context,
//             //         MaterialPageRoute(
//             //             builder: (context) =>
//             //                 BuyCarDetails()), // Navigate to SellCars screen
//             //       );
//             //       print("object");
//             //     },
//             //     child: Container(
//             //       decoration: BoxDecoration(
//             //           borderRadius: BorderRadius.circular(15),
//             //           boxShadow: <BoxShadow>[
//             //             BoxShadow(
//             //               color: Colors.blueGrey.shade50, // Shadow color
//             //               blurRadius: 15.0, // Spread of shadow
//             //               offset: const Offset(0.0, 0.75), // Position of shadow
//             //             ),
//             //           ],
//             //           border: Border.all(color: myColor.backgroundColor)
//             //       ),
//             //       child: Padding(
//             //         padding: const EdgeInsets.only(left: 15, right: 15 , top: 10, bottom: 10),
//             //         child: Column(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //           children: [
//             //             Container(
//             //               decoration: BoxDecoration(
//             //                 color: myColor.greyColor,
//             //                   borderRadius: BorderRadius.circular(15),
//             //                   boxShadow: <BoxShadow>[
//             //                     BoxShadow(
//             //                       color: Colors.blueGrey.shade50, // Shadow color
//             //                       blurRadius: 15.0, // Spread of shadow
//             //                       offset: const Offset(0.0, 0.75), // Position of shadow
//             //                     ),
//             //                   ],
//             //               ),
//             //               child: Column(
//             //                 children: [
//             //                   const Padding(
//             //                     padding: EdgeInsets.only(left: 15, right: 15, top: 10),
//             //                     child: Row(
//             //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                       children: [
//             //                         Icon(CupertinoIcons.heart_fill),
//             //                         Icon(CupertinoIcons.heart),
//             //                       ],
//             //                     ),
//             //                   ),
//             //                   Image.asset("assets/images/Coupe_car.png", height: height * 0.25, width: width * 1,)
//             //                 ],
//             //               ),
//             //             ),
//             //             Row(
//             //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //               children: [
//             //                 Container(
//             //                   decoration: BoxDecoration(
//             //                     color: myColor.backgroundColor,
//             //                       borderRadius: BorderRadius.circular(15),
//             //                       boxShadow: <BoxShadow>[
//             //                         BoxShadow(
//             //                           color: Colors.blueGrey.shade50, // Shadow color
//             //                           blurRadius: 15.0, // Spread of shadow
//             //                           offset: const Offset(0.0, 0.75), // Position of shadow
//             //                         ),
//             //                       ],
//             //                   ),
//             //                   child: Padding(
//             //                     padding: const EdgeInsets.all(8.0),
//             //                     child: Text(
//             //                       'Sedan',
//             //                       style: TextStyle(
//             //                         fontFamily: 'RobotoR',
//             //                         fontSize: 20,
//             //                         color: myColor.secondaryColor,
//             //                       ),
//             //                     ),
//             //                   ),
//             //                 ),
//             //                 Text(
//             //                       '500K',
//             //                       style: TextStyle(
//             //                         fontFamily: 'RobotoR',
//             //                         fontSize: 20,
//             //                         color: myColor.textColor,
//             //                       ),
//             //                     ),
//             //               ],
//             //             ),
//             //             Text("Mercedes-Benz",style: TextStyle(
//             //               fontSize: 25,
//             //               fontFamily: "RobotoM",
//             //               color: myColor.textColor
//             //             ),),
//             //             Divider(),
//             //             Row(
//             //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //               children: [
//             //                 Row(
//             //                   children: [
//             //                     Icon(CupertinoIcons.map),
//             //                     SizedBox(width: 5),
//             //                     Text(
//             //                       "Manual",
//             //                       style: TextStyle(
//             //                         fontSize: 20,
//             //                         fontFamily: "RobotoR",
//             //                         color: myColor.backgroundColor,
//             //                       ),
//             //                     ),
//             //                   ],
//             //                 ),
//             //                 Row(
//             //                   children: [
//             //                     Icon(CupertinoIcons.arrow_swap),
//             //                     SizedBox(width: 5),
//             //                     Text(
//             //                       "Petrol",
//             //                       style: TextStyle(
//             //                         fontSize: 20,
//             //                         fontFamily: "RobotoR",
//             //                         color: myColor.backgroundColor,
//             //                       ),
//             //                     ),
//             //                   ],
//             //                 ),
//             //                 Row(
//             //                   children: [
//             //                     Icon(CupertinoIcons.person_2_fill),
//             //                     SizedBox(width: 5),
//             //                     Text(
//             //                       "Person",
//             //                       style: TextStyle(
//             //                         fontSize: 20,
//             //                         fontFamily: "RobotoR",
//             //                         color: myColor.backgroundColor,
//             //                       ),
//             //                     ),
//             //                   ],
//             //                 ),
//             //               ],
//             //             )
//             //           ],
//             //         ),
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: <BoxShadow>[
//                       BoxShadow(
//                         color: Colors.blueGrey.shade50, // Shadow color
//                         blurRadius: 15.0, // Spread of shadow
//                         offset: const Offset(0.0, 0.75), // Position of shadow
//                       ),
//                     ],
//                     border: Border.all(color: myColor.backgroundColor)
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 15, right: 15 , top: 10, bottom: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: myColor.greyColor,
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: <BoxShadow>[
//                               BoxShadow(
//                                 color: Colors.blueGrey.shade50, // Shadow color
//                                 blurRadius: 15.0, // Spread of shadow
//                                 offset: const Offset(0.0, 0.75), // Position of shadow
//                               ),
//                             ],
//                         ),
//                         child: Column(
//                           children: [
//                             const Padding(
//                               padding: EdgeInsets.only(left: 15, right: 15, top: 10),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Icon(CupertinoIcons.heart_fill),
//                                   Icon(CupertinoIcons.heart),
//                                 ],
//                               ),
//                             ),
//                             Image.asset("assets/images/Coupe_car.png", height: height * 0.25, width: width * 1,)
//                           ],
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: myColor.backgroundColor,
//                                 borderRadius: BorderRadius.circular(15),
//                                 boxShadow: <BoxShadow>[
//                                   BoxShadow(
//                                     color: Colors.blueGrey.shade50, // Shadow color
//                                     blurRadius: 15.0, // Spread of shadow
//                                     offset: const Offset(0.0, 0.75), // Position of shadow
//                                   ),
//                                 ],
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Sedan',
//                                 style: TextStyle(
//                                   fontFamily: 'RobotoR',
//                                   fontSize: 20,
//                                   color: myColor.secondaryColor,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Text(
//                                 '500K',
//                                 style: TextStyle(
//                                   fontFamily: 'RobotoR',
//                                   fontSize: 20,
//                                   color: myColor.textColor,
//                                 ),
//                               ),
//                         ],
//                       ),
//                       Text("Mercedes-Benz",style: TextStyle(
//                         fontSize: 25,
//                         fontFamily: "RobotoM",
//                         color: myColor.textColor
//                       ),),
//                       Divider(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(CupertinoIcons.map),
//                               SizedBox(width: 5),
//                               Text(
//                                 "Manual",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: "RobotoR",
//                                   color: myColor.backgroundColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(CupertinoIcons.arrow_swap),
//                               SizedBox(width: 5),
//                               Text(
//                                 "Petrol",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: "RobotoR",
//                                   color: myColor.backgroundColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(CupertinoIcons.person_2_fill),
//                               SizedBox(width: 5),
//                               Text(
//                                 "Person",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: "RobotoR",
//                                   color: myColor.backgroundColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: <BoxShadow>[
//                       BoxShadow(
//                         color: Colors.blueGrey.shade50, // Shadow color
//                         blurRadius: 15.0, // Spread of shadow
//                         offset: const Offset(0.0, 0.75), // Position of shadow
//                       ),
//                     ],
//                     border: Border.all(color: myColor.backgroundColor)
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 15, right: 15 , top: 10, bottom: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: myColor.greyColor,
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: <BoxShadow>[
//                               BoxShadow(
//                                 color: Colors.blueGrey.shade50, // Shadow color
//                                 blurRadius: 15.0, // Spread of shadow
//                                 offset: const Offset(0.0, 0.75), // Position of shadow
//                               ),
//                             ],
//                         ),
//                         child: Column(
//                           children: [
//                             const Padding(
//                               padding: EdgeInsets.only(left: 15, right: 15, top: 10),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Icon(CupertinoIcons.heart_fill),
//                                   Icon(CupertinoIcons.heart),
//                                 ],
//                               ),
//                             ),
//                             Image.asset("assets/images/Coupe_car.png", height: height * 0.25, width: width * 1,)
//                           ],
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: myColor.backgroundColor,
//                                 borderRadius: BorderRadius.circular(15),
//                                 boxShadow: <BoxShadow>[
//                                   BoxShadow(
//                                     color: Colors.blueGrey.shade50, // Shadow color
//                                     blurRadius: 15.0, // Spread of shadow
//                                     offset: const Offset(0.0, 0.75), // Position of shadow
//                                   ),
//                                 ],
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Sedan',
//                                 style: TextStyle(
//                                   fontFamily: 'RobotoR',
//                                   fontSize: 20,
//                                   color: myColor.secondaryColor,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Text(
//                                 '500K',
//                                 style: TextStyle(
//                                   fontFamily: 'RobotoR',
//                                   fontSize: 20,
//                                   color: myColor.textColor,
//                                 ),
//                               ),
//                         ],
//                       ),
//                       Text("Mercedes-Benz",style: TextStyle(
//                         fontSize: 25,
//                         fontFamily: "RobotoM",
//                         color: myColor.textColor
//                       ),),
//                       Divider(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(CupertinoIcons.map),
//                               SizedBox(width: 5),
//                               Text(
//                                 "Manual",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: "RobotoR",
//                                   color: myColor.backgroundColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(CupertinoIcons.arrow_swap),
//                               SizedBox(width: 5),
//                               Text(
//                                 "Petrol",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: "RobotoR",
//                                   color: myColor.backgroundColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(CupertinoIcons.person_2_fill),
//                               SizedBox(width: 5),
//                               Text(
//                                 "Person",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: "RobotoR",
//                                   color: myColor.backgroundColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class BuyCarCategoryCard extends StatelessWidget {
//   final String title;
//   final String imagePath;
//
//   const BuyCarCategoryCard({
//     Key? key,
//     required this.title,
//     required this.imagePath,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 5),
//             child: Text(
//               title,
//               style: const TextStyle(
//                   fontFamily: 'RobotoR',
//                   fontSize: 12.4,
//                   color: myColor.secondaryColor),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//             width: 65,
//             child: Image.asset(imagePath),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//











// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// import '../buy_cars/BuyCarsDetails.dart';
// import '../buy_cars/buy_car.dart';
// import '../colors.dart';
//
// class PostYourAd extends StatefulWidget {
//
//   @override
//   State<PostYourAd> createState() => _PostYourAdState();
// }
//
// class _PostYourAdState extends State<PostYourAd> {
//   final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("post_your_ad");
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: myColor.backgroundColor,
//       //   title: Center(
//       //     child: Text(
//       //       "Buy new Cars",
//       //       style: TextStyle(
//       //         fontSize: 30,
//       //         fontFamily: 'RobotoR',
//       //         color: myColor.secondaryColor,
//       //       ),
//       //     ),
//       //   ),
//       // ),
//       body: StreamBuilder(
//         stream: databaseRef.onValue,
//         builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
//           if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
//             return Center(child: Text("No ads available"));
//           }
//           final value = snapshot.data!.snapshot.value;
//           if (value is! Map<dynamic, dynamic>) {
//             return Center(child: Text("Unexpected data format"));
//           }
//           Map<dynamic, dynamic> ads = value;
//           List<MapEntry<dynamic, dynamic>> adList = ads.entries.toList();
//           return ListView.builder(
//             itemCount: adList.length,
//             itemBuilder: (context, index) {
//               Map adData = adList[index].value;
//               return Column(
//                 children: [
//                   GestureDetector(
//                     onTap: (){
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => BuyCarDetails(
//                             carBrand: adData["carBrand"] ?? "No Brand",
//                             carModel: adData["carModel"] ?? "No Model",
//                             price: "${adData["price"] ?? "N/A"}",
//                             location: "${adData["location"] ?? "Unknown"}",
//                             registeredIn: "${adData["registeredIn"] ?? "Unknown"}",
//                             bodyColor: "${adData["bodyColor"] ?? "N/A"}",
//                             kmsDriven: "${adData["kmsDriven"] ?? "0"}",
//                             fuelType: "${adData["fuelType"] ?? "Unknown"}",
//                             engineCapacity: "${adData["engineCapacity"] ?? "N/A"}",
//                             transmission: "${adData["transmission"] ?? "N/A"}",
//                             assembly: "${adData["assembly"] ?? "Unknown"}",
//                             tradeInOption: "${adData["Allowed"] ?? "Unknown"}",
//                             name: "${adData["name"] ?? "Unknown"}",
//                             mobileNumber: "Mobile: ${adData["mobileNumber"] ?? "N/A"}",
//                             description: "${adData["description"] ?? "No description available"}",
//                             selectedFeatures: (adData["selectedFeatures"] as Map<dynamic, dynamic>?)
//                                 ?.map((key, value) => MapEntry(key.toString(), value as bool)) ??
//                                 {}, // Ensure it is a valid Map<String, bool>
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       margin: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: <BoxShadow>[
//                             BoxShadow(
//                               color: Colors.blueGrey.shade50, // Shadow color
//                               blurRadius: 15.0, // Spread of shadow
//                               offset: const Offset(0.0, 0.75), // Position of shadow
//                             ),
//                           ],
//                           border: Border.all(color: myColor.backgroundColor)
//                       ),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 15, right: 15 , top: 10, bottom: 10),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: myColor.greyColor,
//                                     borderRadius: BorderRadius.circular(15),
//                                     boxShadow: <BoxShadow>[
//                                       BoxShadow(
//                                         color: Colors.blueGrey.shade50, // Shadow color
//                                         blurRadius: 15.0, // Spread of shadow
//                                         offset: const Offset(0.0, 0.75), // Position of shadow
//                                       ),
//                                     ],
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       const Padding(
//                                         padding: EdgeInsets.only(left: 15, right: 15, top: 10),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.end,
//                                           children: [
//                                             //Icon(CupertinoIcons.heart_fill),
//                                             Icon(CupertinoIcons.heart),
//                                           ],
//                                         ),
//                                       ),
//                                       Image.asset("assets/images/Coupe_car.png", height: height * 0.25, width: width * 1,)
//                                     ],
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: myColor.backgroundColor,
//                                         borderRadius: BorderRadius.circular(15),
//                                         boxShadow: <BoxShadow>[
//                                           BoxShadow(
//                                             color: Colors.blueGrey.shade50, // Shadow color
//                                             blurRadius: 15.0, // Spread of shadow
//                                             offset: const Offset(0.0, 0.75), // Position of shadow
//                                           ),
//                                         ],
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           adData["carBrand"] ?? "No Model",
//                                           style: TextStyle(
//                                             fontFamily: 'RobotoR',
//                                             fontSize: 20,
//                                             color: myColor.secondaryColor,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Text(
//                                       "${adData["price"]}",
//                                       style: TextStyle(
//                                         fontFamily: 'RobotoM',
//                                         fontSize: 20,
//                                         color: myColor.textColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text("${adData["carModel"]}",
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           fontFamily: "RobotoM",
//                                           color: myColor.textColor
//                                       ),
//                                     ),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text("Trade In Option"),
//                                         SizedBox(width: 5),
//                                         Text(
//                                           "${adData["tradeInOption"]}",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20,
//                                             fontFamily: "RobotoR",
//                                             color: myColor.backgroundColor,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 Divider(),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Icon(CupertinoIcons.map),
//                                         SizedBox(width: 5),
//                                         Text(
//                                           "${adData["transmission"]}",
//                                           style: TextStyle(
//                                             fontSize: 20,
//                                             fontFamily: "RobotoR",
//                                             color: myColor.backgroundColor,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Icon(CupertinoIcons.arrow_swap),
//                                         SizedBox(width: 5),
//                                         Text(
//                                           "${adData["fuelType"]}",
//                                           style: TextStyle(
//                                             fontSize: 20,
//                                             fontFamily: "RobotoR",
//                                             color: myColor.backgroundColor,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Icon(CupertinoIcons.location),
//                                         SizedBox(width: 5),
//                                         Text(
//                                           "${adData["location"]}",
//                                           style: TextStyle(
//                                             fontSize: 20,
//                                             fontFamily: "RobotoR",
//                                             color: myColor.backgroundColor,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(adData["carBrand"] ?? "No Model",
//                                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                                 SizedBox(height: 5),
//                                 Text(adData["carModel"] ?? "No Model",
//                                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                                 SizedBox(height: 5),
//                                 Text("Price: ${adData["price"]}"),
//                                 Text("Location: ${adData["location"]}"),
//                                 Text("Registered In: ${adData["registeredIn"]}"),
//                                 Text("Body Color: ${adData["bodyColor"]}"),
//                                 Text("KMs Driven: ${adData["kmsDriven"]}"),
//                                 Text("Fuel Type: ${adData["fuelType"]}"),
//                                 Text("Engine Capacity: ${adData["engineCapacity"]}"),
//                                 Text("Transmission: ${adData["transmission"]}"),
//                                 Text("Trade In Option: ${adData["tradeInOption"]}"),
//                                 Text("Assembly: ${adData["assembly"]}"),
//                                 Text("Seller: ${adData["name"]}"),
//                                 Text("Mobile: ${adData["mobileNumber"]}"),
//                                 Text("Description: ${adData["description"]}"),
//                                 SizedBox(height: 10),
//                                 Text("Features:", style: TextStyle(fontWeight: FontWeight.bold)),
//                                 Wrap(
//                                   children: (adData["selectedFeatures"] as Map<dynamic, dynamic>)
//                                       .entries
//                                       .where((feature) => feature.value == true)
//                                       .map((feature) => Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: Chip(label: Text(feature.key)),
//                                   ))
//                                       .toList(),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../bottom_navigation_bar/SavedPage.dart';
import '../buy_cars/BuyCarsDetails.dart';
import '../colors.dart';

class PostYourAd extends StatefulWidget {
  final Map<String, dynamic>? filters;

  const PostYourAd({Key? key, this.filters}) : super(key: key);

  @override
  State<PostYourAd> createState() => _PostYourAdState();
}

class _PostYourAdState extends State<PostYourAd> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("post_your_ad");
  final DatabaseReference savedAdsRef = FirebaseDatabase.instance.ref("saved_ads/test_user"); // Change user ID in real app
  Set<String> savedAdKeys = {};

  @override
  void initState() {
    super.initState();
    _loadSavedAds();
  }

  void _loadSavedAds() {
    savedAdsRef.onValue.listen((event) {
      final data = event.snapshot.value;
      if (data is Map) {
        setState(() {
          savedAdKeys = data.keys.map((key) => key.toString()).toSet();
        });
      }
    });
  }

  bool _matchesFilters(Map adData) {
    final filters = widget.filters;
    if (filters == null || filters.isEmpty) return true;

    bool match(String key) {
      return filters[key] == null ||
          filters[key].toString().isEmpty ||
          (adData[key]?.toString().toLowerCase() ==
              filters[key].toString().toLowerCase());
    }

    bool matchBudget() {
      if (filters["budget"] == null) return true;
      final price = int.tryParse(adData["price"].toString()) ?? 0;
      return price <= (filters["budget"] as int);
    }

    bool matchYear() {
      return filters["year"] == null ||
          adData["year"].toString() == filters["year"].toString();
    }

    return match("carBrand") &&
        match("location") &&
        match("transmission") &&
        match("carModel") &&
        match("bodyColor") &&
        match("fuelType") &&
        matchBudget() &&
        matchYear();
  }

  void _toggleSaveAd(String adKey, Map adData) async {
    if (savedAdKeys.contains(adKey)) {
      await savedAdsRef.child(adKey).remove();
      setState(() {
        savedAdKeys.remove(adKey);
      });
    } else {
      await savedAdsRef.child(adKey).set(adData);
      setState(() {
        savedAdKeys.add(adKey);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Browse Cars",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'RobotoM',
              color: myColor.secondaryColor,
            ),
          ),
        ),
        backgroundColor: myColor.backgroundColor,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.heart_fill, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SavedAdsScreen()),
              );
            },
          )
        ],
      ),
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
              final adEntry = adList[index];
              final adKey = adEntry.key.toString();
              final adData = Map<String, dynamic>.from(adEntry.value);

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BuyCarDetails(
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
                child: Stack(
                  children: [
                    Container(
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
                            Image.asset("assets/images/Coupe_car.png", height: height * 0.25, width: width),
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
                                        color: Colors.blueGrey.shade50,
                                        blurRadius: 15.0,
                                        offset: const Offset(0.0, 0.75),
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
                    Positioned(
                      top: 15,
                      right: 15,
                      child: InkWell(
                        onTap: () => _toggleSaveAd(adKey, adData),
                        child: Icon(
                          savedAdKeys.contains(adKey) ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                          color: Colors.redAccent,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
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
