import 'package:auto_care_project/sell_cars/SellCarView.dart';
import 'package:auto_care_project/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PredictCarPrice extends StatefulWidget {
  const PredictCarPrice({super.key});

  @override
  State<PredictCarPrice> createState() => _PredictCarPriceState();
}

class _PredictCarPriceState extends State<PredictCarPrice> {
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
            "Predict Car Price",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoR',
              color: myColor.secondaryColor,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Resellers-Cars-Price.webp"),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [

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
                        "Enter your car details",
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
                                'Enter your car model', // Example format for car registration
                              ),

                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText:
                                'Enter your car color', // Example format for car registration
                              ),

                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText:
                                'Enter your car company', // Example format for car registration
                              ),

                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText:
                                'Enter your car engine capacity', // Example format for car registration
                              ),

                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText:
                                'Enter your car fuel type', // Example format for car registration
                              ),

                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText:
                                'Enter your car transmission', // Example format for car registration
                              ),

                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: height * 0.065,
                              width: width * 1,
                              child: ElevatedButton(
                                onPressed: () {

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
                                  'Predict',
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
        ],
      ),
    );
  }
}
