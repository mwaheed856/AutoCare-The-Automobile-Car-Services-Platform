import 'package:auto_care_project/bottom_navigation_bar/SavedPage.dart';
import 'package:auto_care_project/buy_cars/buy_car.dart';
import 'package:auto_care_project/sell_cars/SellCars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../colors.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.secondaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Muhammad Waheed",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'RobotoM',
                color: myColor.backgroundColor,
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                child: Text(
                  "Edit Profile >",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'RobotoR',
                    color: myColor.textColor,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
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
                  width: 2, // Border width
                  color: Colors.transparent, // No border color
                ),
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Row(
                spacing: 10,
                children: [
                  Image.asset(
                    "assets/images/sell_car.png",
                    height: 100,
                    width: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Do you want to Sell Your Car for free?",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'RobotoR',
                          color: myColor.textColor,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SellCars()));
                          },
                          child: Text(
                            "Sell it yourself",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'RobotoM',
                              color: myColor.backgroundColor,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              spacing: 8,
              children: [
                Icon(CupertinoIcons.car),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SellCars()));
                    },
                    child: Text(
                      "Sell your car",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'RobotoR',
                        color: myColor.textColor,
                      ),
                    )),
              ],
            ),
            Divider(
              thickness: 0.5,
            ),
            Row(
              spacing: 8,
              children: [
                Icon(CupertinoIcons.car),
                // TextButton(
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => BuyCars()));
                //     },
                //     child: Text(
                //       "Buy your car",
                //       style: TextStyle(
                //         fontSize: 15,
                //         fontFamily: 'RobotoR',
                //         color: myColor.textColor,
                //       ),
                //     )),
              ],
            ),
            Divider(
              thickness: 0.5,
            ),
            Row(
              spacing: 8,
              children: [
                Icon(CupertinoIcons.heart),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SavedAdsScreen()));
                    },
                    child: Text(
                      "Saved Ads",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'RobotoR',
                        color: myColor.textColor,
                      ),
                    )),
              ],
            ),
            Divider(
              thickness: 0.5,
            ),
            ElevatedButton(
              onPressed: () {
                sendSMS('03184048814', 'Hello, this is a test message from Flutter!');
              },
              child: Text('Send Message'),
            )

          ],
        ),
      )),
    );
  }
}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: myColor.secondaryColor,
          title: Align(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'RobotoM',
                    color: myColor.textColor,
                  ),
                )),
          )),
      backgroundColor: myColor.secondaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Edit Personal Info",
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'RobotoM',
                color: myColor.backgroundColor,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'UserName',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 3, color: Color(0xffF48A20))),
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
            Text(
              "Email",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoR',
                color: myColor.textColor,
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoR',
                    color: myColor.textColor,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _PasswordBottomSheetMenu(context);
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'RobotoR',
                        color: myColor.backgroundColor,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "For Changing Password",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'RobotoR',
                  color: myColor.backgroundColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phone",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoR',
                    color: myColor.textColor,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _PhoneBottomSheetMenu(context);
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'RobotoR',
                        color: myColor.backgroundColor,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "0318-404088814",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'RobotoR',
                  color: myColor.backgroundColor,
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
          ],
        ),
      )),
    );
  }
}

void _PasswordBottomSheetMenu(BuildContext context) {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  showModalBottomSheet(
    context: context,
    builder: (builder) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'RobotoM',
                      color: myColor.backgroundColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Aim for a password that's easy to remember, but hard to guess.",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'RobotoR',
                      color: myColor.textColor,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Enter current password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? CupertinoIcons.lock_fill
                              : CupertinoIcons.lock_open_fill,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Enter new Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? CupertinoIcons.lock_fill
                              : CupertinoIcons.lock_open_fill,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            myColor.backgroundColor, // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                        elevation: 5, // Shadow effect
                        textStyle: TextStyle(
                          fontSize: 20, // Text size
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontFamily: 'RobotoR',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}

void _PhoneBottomSheetMenu(BuildContext context) {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _obscurePassword = true;

  showModalBottomSheet(
    context: context,
    builder: (builder) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit phone number",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'RobotoM',
                      color: myColor.backgroundColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "For notifications and help logging in",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'RobotoR',
                      color: myColor.textColor,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: 'Enter phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Phone number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      if (value.length < 11) {
                        return 'Phone number must be at least 11 digits long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            myColor.backgroundColor, // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                        elevation: 5, // Shadow effect
                        textStyle: TextStyle(
                          fontSize: 20, // Text size
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontFamily: 'RobotoR',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}

void sendSMS(String phoneNumber, String message) async {
  final Uri smsUri = Uri(
    scheme: 'sms',
    path: phoneNumber,
    queryParameters: {'body': message},
  );

  if (await canLaunchUrl(smsUri)) {
    await launchUrl(smsUri);
  } else {
    throw 'Could not launch SMS';
  }
}
