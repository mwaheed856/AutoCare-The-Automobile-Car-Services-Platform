import 'package:auto_care_project/bottom_navigation_bar/NotificationPage.dart';
import 'package:auto_care_project/trade_your_car/TradeYourCar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buy_cars/BuyCarsDetails.dart';
import '../colors.dart';

// class CompareCars extends StatelessWidget {
//   final Map<String, dynamic> carData;       // Existing car
//   final Map<String, dynamic> tradeCarData;  // Trade-in car
//
//   const CompareCars({
//     super.key,
//     required this.carData,
//     required this.tradeCarData,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             "Compare Your Car",
//             style: TextStyle(
//               fontSize: 25,
//               fontFamily: 'RobotoM',
//               color: myColor.secondaryColor,
//             ),
//           ),
//         ),
//         backgroundColor: myColor.backgroundColor,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: IntrinsicHeight( // 🛠 FIX: Allow vertical divider to size correctly
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text("Existing Car (For Sale)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                     SizedBox(height: 8),
//                     Text("Car Brand: ${carData["carBrand"]}"),
//                     Text("Car Model: ${carData["carModel"]}"),
//                     Text("Location: ${carData["location"]}"),
//                     Text("Engine Capacity: ${carData["engineCapacity"]}"),
//                     Text("Kilometers Driven: ${carData["kmsDriven"]}"),
//                     Text("Transmission: ${carData["transmission"]}"),
//                     Text("Assembly: ${carData["assembly"]}"),
//                     Text("Registered In: ${carData["registeredIn"]}"),
//                     Text("Body Color: ${carData["bodyColor"]}"),
//                     Text("Fuel Type: ${carData["fuelType"]}"),
//                     Text("Price: ${carData["price"]}"),
//                     Text("Trade-In Option: ${carData["tradeInOption"]}"),
//                     Text("Seller Name: ${carData["name"]}"),
//                     Text("Mobile Number: ${carData["mobileNumber"]}"),
//                     SizedBox(height: 8),
//                     Text("Features:", style: TextStyle(fontWeight: FontWeight.bold)),
//                     ..._buildFeatureRows(carData["selectedFeatures"]),
//                   ],
//                 ),
//               ),
//
//               /// Vertical Divider
//               Container(
//                 width: 1,
//                 color: Colors.grey.shade300,
//                 margin: EdgeInsets.symmetric(horizontal: 16),
//               ),
//
//               /// Second Column – Trade Car
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text("🔁 Your Car",
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                     SizedBox(height: 8),
//                     Text("Brand: ${tradeCarData["brand"]}"),
//                     Text("Model: ${tradeCarData["model"]}"),
//                     Text("Location: ${tradeCarData["location"]}"),
//                     Text("Engine Capacity: ${tradeCarData["engineCapacity"]}"),
//                     Text("KMs Driven: ${tradeCarData["kmsDriven"]}"),
//                     Text("Transmission: ${tradeCarData["transmission"]}"),
//                     Text("Assembly: ${tradeCarData["assembly"]}"),
//                     if (tradeCarData.isNotEmpty)
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: tradeCarData.entries
//                             .where((entry) => ![
//                           "location",
//                           "brand",
//                           "model",
//                           "engineCapacity",
//                           "kmsDriven",
//                           "price",
//                           "transmission",
//                           "assembly"
//                         ].contains(entry.key))
//                             .map((entry) => Text("${entry.key}: ${entry.value}"))
//                             .toList(),
//                       ),
//                     Text("Price: ${tradeCarData["price"]}"),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildFeatureRows(Map<String, bool> selectedFeaturesMap) {
//     final selectedFeatures = selectedFeaturesMap.entries
//         .where((entry) => entry.value)
//         .map((entry) => entry.key)
//         .toList();
//
//     List<Widget> rows = [];
//     for (int i = 0; i < selectedFeatures.length; i += 2) {
//       final chunk = selectedFeatures.skip(i).take(3).toList();
//       rows.add(
//         Row(
//           children: chunk
//               .map((feature) => Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Chip(label: Text(feature)),
//           ))
//               .toList(),
//         ),
//       );
//     }
//     return rows;
//   }
// }
class CompareCars extends StatelessWidget {
  final Map<String, dynamic> carData;       // Existing car
  final Map<String, dynamic> tradeCarData;  // Trade-in car

  const CompareCars({
    super.key,
    required this.carData,
    required this.tradeCarData,
  });

  @override
  Widget build(BuildContext context) {
    // Comparison fields
    final List<Map<String, String>> compareFields = [
      {"label": "Brand", "left": carData["carBrand"], "right": tradeCarData["brand"]},
      {"label": "Model", "left": carData["carModel"], "right": tradeCarData["model"]},
      {"label": "Location", "left": carData["location"], "right": tradeCarData["location"]},
      {"label": "Engine", "left": carData["engineCapacity"], "right": tradeCarData["engineCapacity"]},
      {"label": "KMs Driven", "left": carData["kmsDriven"], "right": tradeCarData["kmsDriven"]},
      {"label": "Transmission", "left": carData["transmission"], "right": tradeCarData["transmission"]},
      {"label": "Assembly", "left": carData["assembly"], "right": tradeCarData["assembly"]},
      {"label": "Registered In", "left": carData["registeredIn"] ?? "-", "right": tradeCarData["Registered In"] ?? "-"},
      {"label": "Body Color", "left": carData["bodyColor"] ?? "-", "right": tradeCarData["Body Color"] ?? "-"},
      {"label": "Fuel Type", "left": carData["fuelType"] ?? "-", "right": tradeCarData["Fuel Type"] ?? "-"},
      {"label": "Price", "left": carData["price"], "right": tradeCarData["price"]},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Compare Your Car",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'RobotoM',
              color: myColor.secondaryColor,
            ),
          ),
        ),
        backgroundColor: myColor.backgroundColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text("Existing Car", style: TextStyle(fontSize: 25, fontFamily: 'RobotoM')),
                ),
                Expanded(child: SizedBox()), // Spacer
                Expanded(
                  child: Text("🔁 Your Car", style: TextStyle(fontSize: 25, fontFamily: 'RobotoM')),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Comparison Rows
            ...compareFields.map((field) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Center(child: _buildLabelChip(field["label"] ?? "")),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          field["left"] ?? "-",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 15, fontFamily: "RobotoR"),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          field["right"] ?? "-",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 15, fontFamily: "RobotoR"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            )),
            TextButton(onPressed: (){}, child: Text("Send Message"))
          ],
        ),
      ),
    );
  }

  Widget _buildLabelChip(String label) {
    return Container(
      decoration: BoxDecoration(
        color: myColor.greyColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: myColor.greyColor, // Shadow color
            blurRadius: 15.0, // Spread of shadow
            offset: const Offset(0.0, 0.75), // Position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 70,right: 70,top: 5,bottom: 5),
      child: Text(
        label,
        style: const TextStyle(fontSize: 20,fontFamily: 'RobotoR'),
      ),
    );
  }
}
