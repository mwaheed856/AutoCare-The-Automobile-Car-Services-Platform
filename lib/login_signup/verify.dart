import 'package:auto_care_project/colors.dart';
import 'package:auto_care_project/login_signup/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class verify extends StatefulWidget {
  const verify({super.key});

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {
  @override
  void initState() {
    sendverifylink();
    super.initState();
  }

  sendverifylink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) => {
          Get.snackbar('Link send', 'A link has been send to your email',
              margin: EdgeInsets.all(30), snackPosition: SnackPosition.BOTTOM)
        });
  }

  reload() async {
    await FirebaseAuth.instance.currentUser!
        .reload()
        .then((value) => {Get.offAll(wrapper())});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 80, right: 80),
        child: Container(
          height: height * 1,
          width: width * 1,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.09,
              ),
              Text(
                "We've sent you a conformation mail",
                style: TextStyle(fontSize: 20, fontFamily: 'RobotoM',
                ),
              ),
              Image.asset("images/email_verification_icon.png"),
              Text(
                "Check your inbox, please!",
                style: TextStyle(fontSize: 20,
                  fontFamily: 'RobotoM',
                ),
              ),
              Text(
                "Click the link to confirm your account.",
                style: TextStyle(
                  fontFamily: 'RobotoR',
                  fontSize: 15,
                ),
              ),
              Text(
                "If you can't find the email check the spam folder.",
                style: TextStyle(
                  fontFamily: 'RobotoR',
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              ElevatedButton(
                  onPressed: (() => reload()),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 125, vertical: 15), // Button size
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
                  child: Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
