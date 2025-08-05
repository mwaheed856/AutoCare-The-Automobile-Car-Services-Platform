import 'package:auto_care_project/home_screen.dart';
import 'package:auto_care_project/login_signup/login_screen.dart';
import 'package:auto_care_project/login_signup/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class wrapper extends StatefulWidget {
  const wrapper({super.key});

  @override
  State<wrapper> createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if (snapshot.hasData) {
              print(snapshot.data);
              if(snapshot.data!.emailVerified){
                return home_screen();
              }
              else{
                return verify();
              }
            }else {
              return login_screen();
            }
          }),
    );
  }
}
