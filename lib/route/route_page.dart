import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import './route_name.dart';

import '../app/view/screen/page_not_found_screen.dart';
import '../app/view/screen/splash_screen.dart';

class MyRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name){

      case SPLASHSCREEN :
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: settings
      );
      
      default: 
      return PageTransition(
        child: const PageNotFoundScreen(), 
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 600),
        settings: settings
      );
    } 
  }
}