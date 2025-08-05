import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../colors.dart';
import '../buy_cars/BuyCarsDetails.dart';

class SavedAdsScreen extends StatefulWidget {
  const SavedAdsScreen({Key? key}) : super(key: key);

  @override
  State<SavedAdsScreen> createState() => _SavedAdsScreenState();
}

class _SavedAdsScreenState extends State<SavedAdsScreen> {
  final DatabaseReference savedAdsRef = FirebaseDatabase.instance.ref("saved_ads/test_user"); // Change to current user ID
  Map<String, dynamic> savedAds = {};

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
          savedAds = Map<String, dynamic>.from(data);
        });
      }
    });
  }

  void _removeSavedAd(String adKey) async {
    await savedAdsRef.child(adKey).remove();
    setState(() {
      savedAds.remove(adKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Saved Ads",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'RobotoM',
              color: myColor.secondaryColor,
            ),
          ),
        ),
        backgroundColor: myColor.backgroundColor,
      ),
      body: savedAds.isEmpty
          ? const Center(child: Text("No saved ads"))
          : ListView.builder(
        itemCount: savedAds.length,
        itemBuilder: (context, index) {
          final adKey = savedAds.keys.elementAt(index);
          final adData = savedAds[adKey];

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
                border: Border.all(color: myColor.backgroundColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.shade50,
                    blurRadius: 15.0,
                    offset: const Offset(0.0, 0.75),
                  ),
                ],
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
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(CupertinoIcons.delete, color: Colors.red),
                        onPressed: () {
                          // Show confirmation before deleting
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Are you sure?'),
                                content: Text('Do you want to remove this ad from your saved ads?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Delete'),
                                    onPressed: () {
                                      _removeSavedAd(adKey); // Remove from Firebase and UI
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
