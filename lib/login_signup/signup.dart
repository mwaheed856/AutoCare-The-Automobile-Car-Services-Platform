import 'package:auto_care_project/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:auto_care_project/login_signup/login_screen.dart';
import 'package:auto_care_project/login_signup/wrapper.dart';
import 'package:auto_care_project/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: height * 0.13,),
            Container(
              height: height * 0.06,
              width: width * 0.8,
              decoration: BoxDecoration(
                  border: Border.all(color:myColor.backgroundColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: myColor.secondaryColor,
                        fixedSize: Size(width * 0.35, height * 0.06),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide(color:myColor.backgroundColor),
                      ),
                      onPressed: () {
                        //Navigator.pushNamed(context, RouteName.loginScreen);
                       Navigator.push(context, MaterialPageRoute(builder: (context) => login_screen()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: "RobotoM",
                            color: myColor.backgroundColor,
                            fontSize: 20,
                           ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.098,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: myColor.backgroundColor,
                      fixedSize: Size(width * 0.35, height * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: myColor.backgroundColor),
                    ),
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'RobotoM'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.09,
            ),
            Center(
              child: Text(
                "Welcome!",
                style: TextStyle(
                    color: myColor.backgroundColor,
                    fontSize: 30,
                    fontFamily: 'RobotoM',
                fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                "Sign ip to get started",
                style: TextStyle(color: myColor.backgroundColor, fontSize: 15),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: CombinedForm()),
          ],
        ),
      ),
    );
  }
}

class CombinedForm extends StatefulWidget {
  @override
  _CombinedFormState createState() => _CombinedFormState();
}

class _CombinedFormState extends State<CombinedForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  signup() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    final user = FirebaseAuth.instance.currentUser;

    final DatabaseReference usersRef = FirebaseDatabase.instance.ref("users/${user!.uid}");

    await usersRef.set({
      "name": user.displayName ?? "No Name",
      "email": user.email ?? "",
    });

    Get.offAll(wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email Input Field
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'Enter your Username',
            ),
          ),
          SizedBox(height: 16),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email or Phone Number',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Enter your email or phone number',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email or phone number';
            }
            final emailRegex = RegExp(
                r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$');
            final phoneRegex = RegExp(r'^\d{10,15}$');
            if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
              return 'Enter a valid email address or phone number';
            }
            return null;
          },
        ),
          SizedBox(height: 16),

          // Password Input Field
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Enter your password',
              suffixIcon: IconButton(
                icon: Icon(_obscurePassword
                    ? CupertinoIcons.lock_fill
                    : CupertinoIcons.lock_open_fill),
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
          SizedBox(height: 40),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontFamily: 'RobotoR',
                    fontSize: 15,
                    color: myColor.backgroundColor
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => login_screen()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 15, color: myColor.backgroundColor,fontFamily: "RobotoM"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Combined Submit Button
          Center(
            child: ElevatedButton(
              onPressed: (
                  () => signup()
                  ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 80, vertical: 5), // Button size
                backgroundColor: myColor.backgroundColor, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                elevation: 5, // Shadow effect
                textStyle: TextStyle(
                  fontSize: 20, // Text size
                  fontWeight: FontWeight.bold, // Text weight
                ),
              ),
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontFamily: 'RobotoM',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomBar()));
            },
            child: Center(
              child: Text(
                "or",
                style: TextStyle(
                  color: myColor.backgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
