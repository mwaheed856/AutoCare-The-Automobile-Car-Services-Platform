import 'package:auto_care_project/colors.dart';
import 'package:auto_care_project/login_signup/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  TextEditingController email = TextEditingController();
  reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(CupertinoIcons.arrow_left, color: Colors.black),
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          login_screen()));
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Container(
            height: height * 1,
            width: width * 1,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.2,
                  ),
                  Image(
                    image: AssetImage("images/forgot_icon.png"),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    "Enter email to recieve the reset link",
                    style: TextStyle(color: myColor.backgroundColor, fontSize: 20,
                    fontFamily: 'robotoR'),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      final emailRegex = RegExp(
                          r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: (() => reset()),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 125 , vertical: 15), // Button size
                      backgroundColor: myColor.backgroundColor, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                      elevation: 5, // Shadow effect
                      textStyle: TextStyle(
                        fontSize: 20, // Text size
                        fontWeight: FontWeight.bold, // Text weight
                      ),
                    ),
                    child: Text(
                      'Send Link',
                      style: TextStyle(
                        fontFamily: 'RobotoR',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
