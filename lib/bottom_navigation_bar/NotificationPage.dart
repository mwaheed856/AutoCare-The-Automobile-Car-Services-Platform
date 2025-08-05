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
//       // appBar: AppBar(title: Text("All Posted Ads")),
//       body: StreamBuilder(
//         stream: databaseRef.onValue,
//         builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
//           if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
//             return Center(child: Text("No ads available"));
//           }
//
//           final value = snapshot.data!.snapshot.value;
//           if (value is! Map<dynamic, dynamic>) {
//             return Center(child: Text("Unexpected data format"));
//           }
//
//           Map<dynamic, dynamic> ads = value;
//           List<MapEntry<dynamic, dynamic>> adList = ads.entries.toList();
//
//           return ListView.builder(
//             itemCount: adList.length,
//             itemBuilder: (context, index) {
//               Map adData = adList[index].value;
//
//               return Column(
//                 children: [
//
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
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Icon(CupertinoIcons.heart_fill),
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
//                                         fontSize: 25,
//                                         fontFamily: "RobotoM",
//                                         color: myColor.textColor
//                                     ),
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
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../buy_cars/BuyCarsDetails.dart';
import '../colors.dart';

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

