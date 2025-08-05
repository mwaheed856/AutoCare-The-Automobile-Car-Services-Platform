import 'package:auto_care_project/colors.dart';
import 'package:auto_care_project/login_signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../HomePage.dart';
import '../bottom_navigation_bar/bottom_navigation_bar.dart';
import 'forget.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: width * 1,
          height: height * 1,
          decoration: BoxDecoration(),
          child: ListView(
            children: [
              SizedBox(
                height: height * 0.13,
              ),
              Container(
                height: height * 0.06,
                width: width * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(color: myColor.backgroundColor),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: myColor.backgroundColor,
                          fixedSize: Size(width * 0.35, height * 0.06),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(color: myColor.backgroundColor),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'RobotoM',
                            color: myColor.secondaryColor,
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
                        backgroundColor: myColor.secondaryColor,
                        fixedSize: Size(width * 0.35, height * 0.06),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide(color: myColor.backgroundColor),
                      ),
                      onPressed: (() => Get.to(signup())),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontFamily: 'RobotoM',
                          color: myColor.backgroundColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.15,
              ),
              Center(
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                      fontFamily: 'RobotoM',
                      color: myColor.backgroundColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
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
  bool isloading = false;
  bool _obscurePassword = true;
  login_screen() async {
    setState(() {
      isloading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.code);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    setState(() {
      isloading = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BottomBar(

        ),
      ),
    );

    //add home route here
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email Input Field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: myColor.backgroundColor),
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
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 3, color: Color(0xffF48A20))),
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: (() => Get.to(forgot())),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontFamily: 'RobotoR',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: myColor.backgroundColor,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: (() => login_screen()),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 80, vertical: 5), // Button size
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
                    child: Expanded(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'RobotoR',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "or",
                    style: TextStyle(
                      color: myColor.backgroundColor,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                    child: ElevatedButton(
                        onPressed: (() => login_screen()),
                        child: Text("Sign up with google")))
              ],
            ),
          );
  }
}
