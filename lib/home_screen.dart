import 'package:auto_care_project/login_signup/login_screen.dart';
import 'package:auto_care_project/login_signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final user = FirebaseAuth.instance.currentUser;

  signOut()async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Home Page"),
     ),
      body: Center(
        child: Text('${user!.email}'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (()=> signOut()),
      child: Icon(CupertinoIcons.lock),),

    );
  }
}
