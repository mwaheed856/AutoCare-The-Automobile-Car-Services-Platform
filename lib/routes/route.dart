import 'package:auto_care_project/login_signup/login_screen.dart';
import 'package:auto_care_project/login_signup/signup.dart';
import 'package:auto_care_project/login_signup/wrapper.dart';
import 'package:auto_care_project/routes/routes_name.dart';
import 'package:auto_care_project/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash_screen:
        return MaterialPageRoute(builder: (context) => splash_screen());
      case RouteName.wrapper:
        return MaterialPageRoute(builder: (context) => wrapper());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => login_screen());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (context) => signup());
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
