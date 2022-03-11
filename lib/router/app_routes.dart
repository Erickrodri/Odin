import 'package:flutter/material.dart';

import 'package:odin/screens/screens.dart';

class AppRoutes{
  static String initialRoute = 'initial';

  static Map<String, Widget Function(BuildContext)> routes = {
    'initial'       : (BuildContext context) => const InitialScreen(),
    'login'         : (BuildContext context) => const LoginScreen(),
    //'home'        : (BuildContext context) => const HomeScreen(),
    'createAccount' : (BuildContext context) => const CreateAccountScreen(),
    'drawer'        : (BuildContext context) => const DrawerScreen(),
    'details'       : (BuildContext context) => const DetailsScreen(),
  };
}