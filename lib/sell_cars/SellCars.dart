import 'package:auto_care_project/sell_cars/SellCarView.dart';
import 'package:auto_care_project/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class SellCars extends StatefulWidget {
  const SellCars({super.key});

  @override
  State<SellCars> createState() => _SellCarsState();
}

class _SellCarsState extends State<SellCars> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor.backgroundColor,
        title: Center(
          child: Text(
            "Sell Your Cars",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'RobotoR',
              color: myColor.secondaryColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/car_background.jpg"),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Center(
                      child: Text(
                        "SELL CAR ONLINE FOR FREE",
                        style: TextStyle(
                            fontFamily: 'RobotoM',
                            fontSize: 20,
                            color: myColor.secondaryColor),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Expanded(
                          child: Icon(
                            CupertinoIcons.home,
                            color: myColor.secondaryColor,
                            size: height * 0.06,
                            weight: width * 0.06,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Expanded(
                          child: Icon(
                            CupertinoIcons.person_add,
                            color: myColor.secondaryColor,
                            size: height * 0.06,
                            weight: width * 0.06,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Expanded(
                          child: Icon(
                            CupertinoIcons.car_fill,
                            color: myColor.secondaryColor,
                            size: height * 0.06,
                            weight: width * 0.06,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.2,
                        ),
                        Expanded(
                          child: Text(
                            "Sell from your doorstep",
                            style: TextStyle(
                                fontFamily: 'RobotoL',
                                fontSize: 15,
                                color: myColor.secondaryColor),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Expanded(
                          child: Text(
                            "Verified buyers",
                            style: TextStyle(
                                fontFamily: 'RobotoL',
                                fontSize: 15,
                                color: myColor.secondaryColor),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Expanded(
                          child: Text(
                            "Best price for your car",
                            style: TextStyle(
                                fontFamily: 'RobotoL',
                                fontSize: 15,
                                color: myColor.secondaryColor),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                  ],
                )),
            SizedBox(
              height: height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your car registration number",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'RobotoR',
                        color: myColor.backgroundColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText:
                                'DL56 AC 8650', // Example format for car registration
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a car registration number';
                            }
                            // Regular expression for validating car registration number
                            final regNumberRegex = RegExp(
                              r'^[A-Z]{2}-\d{2} [A-Z]{2} \d{4}$', // Example: DL-56 AC 8650
                            );
                            if (!regNumberRegex.hasMatch(value)) {
                              return 'Enter a valid car registration number (e.g., DL-56 AC 8650)';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: height * 0.065,
                          width: width * 1,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SellYourCarScreen()),
                              );
                              if (!_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Invalid car registration number'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Car registration number is valid!'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: myColor.backgroundColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 5,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            child: Text(
                              'Sell your Car',
                              style: TextStyle(
                                  fontFamily: 'RobotoR',
                                  color: myColor.secondaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
