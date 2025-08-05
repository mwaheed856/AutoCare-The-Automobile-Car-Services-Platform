import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Maps/car_wash.dart';
import '../Maps/petrol_pump.dart';
import '../Maps/tyre_shops.dart';
import '../colors.dart';
import 'MechanicShops.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Car Services",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'RobotoM',
              color: myColor.secondaryColor,
            ),
          ),
        ),
        backgroundColor: myColor.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                onPressed: openCarWashInMaps;
              },
              borderRadius: BorderRadius.circular(20),
              splashColor: myColor.backgroundColor.withOpacity(0.3),
              child: ServiceCard(
                height: height,
                width: width,
                title1: 'Car Mechanic',
                imagePath: "assets/images/car_machanic.png",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (

                  ) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TyreShopsMapPage(), // or 'tyre', 'mechanic', 'petrol'
                  ),
                );

              },
              borderRadius: BorderRadius.circular(20),
              splashColor: myColor.backgroundColor.withOpacity(0.3),
              child: ServiceCard(
                height: height,
                width: width,
                title1: 'Car Tyres',
                imagePath: "assets/images/car_tyre.png",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarWashShopsMapPage(), // or 'tyre', 'mechanic', 'petrol'
                  ),
                );

              },
              borderRadius: BorderRadius.circular(20),
              splashColor: myColor.backgroundColor.withOpacity(0.3),
              child: ServiceCard(
                height: height,
                width: width,
                title1: 'Car Wash',
                imagePath: "assets/images/car_wash.png",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetrolPumpMapPage(), // or 'tyre', 'mechanic', 'petrol'
                  ),
                );
              },
              borderRadius: BorderRadius.circular(20),
              splashColor: myColor.backgroundColor.withOpacity(0.3),
              child: ServiceCard(
                height: height,
                width: width,
                title1: 'Petrol Pumps',
                imagePath: "assets/images/petrol_pump.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
  void openCarWashInMaps() async {
    final Uri googleMapUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=car+wash+near+me');

    if (await canLaunchUrl(googleMapUrl)) {
      await launchUrl(googleMapUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch Google Maps';
    }
  }

}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.height,
    required this.width,
    required this.title1,
    required this.imagePath,
  });

  final double height;
  final double width;
  final String title1;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      child: Container(
        height: height * 0.13,
        width: width * 1,
        decoration: BoxDecoration(
          color: myColor.secondaryColor,
          border: Border.all(width: 1, color: myColor.backgroundColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, left: 20),
              child: Text(
                title1,
                style: TextStyle(
                  fontFamily: 'RobotoM',
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: SizedBox(
                height: 150,
                child: Image.asset(imagePath),
              ),
            ),
            const SizedBox(width: 15),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "-->",
                style: TextStyle(
                  fontFamily: 'RobotoM',
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
