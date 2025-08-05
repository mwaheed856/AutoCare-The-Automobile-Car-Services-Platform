import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:auto_care_project/colors.dart';
import '../buy_cars/BuyCarsDetails.dart';

class YourPostsPage extends StatefulWidget {
  const YourPostsPage({super.key});

  @override
  State<YourPostsPage> createState() => _YourPostsPageState();
}

class _YourPostsPageState extends State<YourPostsPage> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("post_your_ad");
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Posts"),
        backgroundColor: myColor.backgroundColor,
      ),
      backgroundColor: myColor.secondaryColor,
      body: StreamBuilder(
        stream: databaseRef.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return const Center(child: Text("No posts found."));
          }

          final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
          final yourAds = data.entries.where((entry) {
            final ad = entry.value as Map<dynamic, dynamic>;
            return ad["userId"] == currentUser?.uid;
          }).toList();

          if (yourAds.isEmpty) {
            return const Center(child: Text("You haven't posted anything yet."));
          }

          return ListView.builder(
            itemCount: yourAds.length,
            itemBuilder: (context, index) {
              final adData = yourAds[index].value;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BuyCarDetails(
                        imageUrl: adData["imageUrl"] ?? "",
                        carBrand: adData["carBrand"] ?? "",
                        carModel: adData["carModel"] ?? "",
                        price: "${adData["price"] ?? "N/A"}",
                        location: "${adData["location"] ?? "Unknown"}",
                        registeredIn: "${adData["registeredIn"] ?? "Unknown"}",
                        bodyColor: "${adData["bodyColor"] ?? "N/A"}",
                        kmsDriven: "${adData["kmsDriven"] ?? "0"}",
                        fuelType: "${adData["fuelType"] ?? "Unknown"}",
                        engineCapacity: "${adData["engineCapacity"] ?? "N/A"}",
                        transmission: "${adData["transmission"] ?? "N/A"}",
                        assembly: "${adData["assembly"] ?? "Unknown"}",
                        tradeInOption: "${adData["tradeInOption"] ?? "Unknown"}",
                        name: "${adData["name"] ?? "Unknown"}",
                        mobileNumber: "Mobile: ${adData["mobileNumber"] ?? "N/A"}",
                        description: "${adData["description"] ?? "No description"}",
                        selectedFeatures: (adData["selectedFeatures"] as Map<dynamic, dynamic>?)
                            ?.map((k, v) => MapEntry(k.toString(), v as bool)) ??
                            {},
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: myColor.backgroundColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        adData["imageUrl"] ?? "https://via.placeholder.com/150",
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${adData["carBrand"]} ${adData["carModel"]}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: myColor.textColor)),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("PKR ${adData["price"] ?? "N/A"}",
                                    style: TextStyle(
                                        fontSize: 16, color: myColor.backgroundColor)),
                                Text("${adData["location"] ?? "Unknown"}"),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
