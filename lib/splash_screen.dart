import 'dart:async';
import 'package:auto_care_project/login_signup/wrapper.dart';
import 'package:flutter/material.dart'
    '';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  SplashServices splash_screen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash_screen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body:  Container(
        height: height * 1,
        width: width * 1,
        child: Image.asset("assets/images/car.png", fit: BoxFit.cover,),
      ),
    );
  }
}

class SplashServices{
  void isLogin(BuildContext context){
    Timer(Duration(seconds: 2), () =>
        Navigator.push(context, MaterialPageRoute(builder: (context) => wrapper())));
        //Navigator.push(context, MaterialPageRoute(builder: (context) => wrapper())));
  }
}