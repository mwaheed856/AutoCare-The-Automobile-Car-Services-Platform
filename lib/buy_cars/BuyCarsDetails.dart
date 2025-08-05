
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../trade_your_car/TradeYourCar.dart';


class BuyCarDetails extends StatelessWidget {
  final String imageUrl;
  final String carBrand;
  final String carModel;
  final String price;
  final String location;
  final String registeredIn;
  final String bodyColor;
  final String kmsDriven;
  final String fuelType;
  final String engineCapacity;
  final String transmission;
  final String tradeInOption; // "Allowed" or "Not Allowed"
  final String assembly;
  final String name;
  final String mobileNumber;
  final String description;
  final Map<String, bool> selectedFeatures;

  BuyCarDetails({
    Key? key,
    required this.imageUrl,
    required this.carBrand,
    required this.carModel,
    required this.price,
    required this.location,
    required this.registeredIn,
    required this.bodyColor,
    required this.kmsDriven,
    required this.fuelType,
    required this.engineCapacity,
    required this.transmission,
    required this.assembly,
    required this.name,
    required this.mobileNumber,
    required this.description,
    required this.selectedFeatures,
    required this.tradeInOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Car Details",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'RobotoR',
              color: myColor.secondaryColor,
            ),
          ),
        ),
        backgroundColor: myColor.backgroundColor,
      ),
      backgroundColor: myColor.secondaryColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: myColor.greyColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.blueGrey.shade50, // Shadow color
                    blurRadius: 15.0, // Spread of shadow
                    offset: const Offset(0.0, 0.75), // Position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(CupertinoIcons.heart_fill),
                        Icon(CupertinoIcons.heart),
                      ],
                    ),
                  ),
                  Image.network(
                    imageUrl,
                    height: height * 0.25,
                    width: width,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, size: 100);
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  )

                ],
              ),
            ),
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
                      carBrand,
                      style: TextStyle(
                        fontFamily: 'RobotoR',
                        fontSize: 20,
                        color: myColor.secondaryColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: 'RobotoR',
                    fontSize: 20,
                    color: myColor.textColor,
                  ),
                ),
              ],
            ),
            Text(
              carModel,
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "RobotoM",
                  color: myColor.textColor),
            ),

            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 15,
                  children: [
                    Icon(
                      CupertinoIcons.person_alt,
                      size: 70,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "RobotoM",
                              color: myColor.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Owner",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "RobotoR",
                            color: myColor.textColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  spacing: 15,
                  children: [
                    Icon(CupertinoIcons.chat_bubble),
                    Icon(CupertinoIcons.phone)
                  ],
                ),
              ],
            ),
            Text(
              "Car Details ",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoM",
                  color: myColor.textColor),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                spacing: 15,
                children: [
                  buycardetails(
                    icon: Icon(CupertinoIcons.location_solid),
                    title1: "Location",
                    title2: location,
                  ),
                  buycardetails(
                    icon: Icon(CupertinoIcons.color_filter),
                    title1: "Color",
                    title2: bodyColor,
                  ),
                  buycardetails(
                    icon: Icon(CupertinoIcons.calendar),
                    title1: "Model Year",
                    title2: registeredIn,
                  ),
                  buycardetails(
                    icon: Icon(CupertinoIcons.time),
                    title1: "KMs Driven",
                    title2: kmsDriven,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //               AllCarDetails()), // Navigate to SellCars screen
                  //     );
                  //     print("Button pressed!");
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: myColor.secondaryColor,
                  //     shadowColor: Colors.blueGrey.shade50,
                  //     shape: RoundedRectangleBorder(
                  //       side: BorderSide(
                  //           width: 0.3, color: myColor.backgroundColor),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     elevation: 2,
                  //   ),
                  //   child: Container(
                  //     height: 90,
                  //     width: 60,
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: const [
                  //         Icon(CupertinoIcons.add),
                  //         SizedBox(height: 5),
                  //         Text("More"),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                spacing: 15,
                children: [
                  buycardetails(
                    icon: Icon(CupertinoIcons.arrow_up_bin),
                    title1: "Fuel Type",
                    title2: fuelType,
                  ),
                  buycardetails(
                    icon: Icon(
                      CupertinoIcons.archivebox,
                      size: 15,
                    ),
                    title1: "Engine Capacity",
                    title2: engineCapacity,
                  ),
                  buycardetails(
                    icon: Icon(
                      CupertinoIcons.map,
                      size: 15,
                    ),
                    title1: "Transmission",
                    title2: transmission,
                  ),
                  buycardetails(
                    icon: Icon(CupertinoIcons.arrow_2_squarepath),
                    title1: "Assembly",
                    title2: assembly,
                  ),
                ],
              ),
            ),
            Text(
              "Features",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoM",
                  color: myColor.textColor),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Wrap(
                    spacing: 10, // Adds spacing between the chips
                    children: selectedFeatures.entries
                        .where((feature) =>
                    feature.value ==
                        true) // Only show selected features
                        .map((feature) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.circle_fill),
                        SizedBox(
                            width:
                            5), // Add some spacing between icon and text
                        Text(
                          feature.key,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "RobotoR",
                            color: myColor.textColor,
                          ),
                        ),
                      ],
                    ))
                        .toList(),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Send this car data to another screen (maybe TradeCarPage)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TradeYourCar(
                      carData: {
                        'carBrand': carBrand,
                        'carModel': carModel,
                        'price': price,
                        'location': location,
                        'registeredIn': registeredIn,
                        'bodyColor': bodyColor,
                        'kmsDriven': kmsDriven,
                        'fuelType': fuelType,
                        'engineCapacity': engineCapacity,
                        'transmission': transmission,
                        'assembly': assembly,
                        'tradeInOption': tradeInOption,
                        'name': name,
                        'mobileNumber': mobileNumber,
                        'description': description,
                        'selectedFeatures': selectedFeatures,
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: myColor.backgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                "Want to Trade your Car? -->",
                style: TextStyle(
                    fontFamily: 'RobotoR', fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class buycardetails extends StatelessWidget {
  final Icon icon;
  final String title1;
  final String title2;

  const buycardetails({
    Key? key,
    required this.icon,
    required this.title1,
    required this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Set height
      width: 100,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blueGrey.shade50, // Shadow color
            blurRadius: 15.0, // Spread of shadow
            offset: const Offset(0.0, 0.75), // Position of shadow
          ),
        ],
        color: myColor.secondaryColor, // Background color
        border: Border.all(
          width: 0.3, // Border width
          color: myColor.backgroundColor, // No border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 2,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            Text(
              title1,
              style: const TextStyle(
                fontFamily: 'RobotoL',
                fontSize: 15,
              ),
            ),
            Text(
              title2,
              style: const TextStyle(
                fontFamily: 'RobotoM',
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AllCarDetails extends StatelessWidget {
  const AllCarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.secondaryColor,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "All Car Details",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'RobotoM',
              color: myColor.secondaryColor,
            ),
          ),
        ),
        backgroundColor: myColor.backgroundColor,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 4,
        children: <Widget>[
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "KMs Driven",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
          buycardetails(
            icon: Icon(CupertinoIcons.location_solid),
            title1: "Location",
            title2: "Lohare",
          ),
        ],
      ),
    );
  }
}
