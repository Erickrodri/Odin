import 'package:flutter/material.dart';

import 'package:odin/router/app_routes.dart';
import 'package:odin/screens/screens.dart';
import 'package:odin/services/services.dart';
import 'package:odin/theme/app_themes.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: (settings) {
        MaterialPageRoute(builder: (context) => const InitialScreen());
      },
      theme: AppThemes.appThemeLigth,
    );
  }
}