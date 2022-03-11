import 'package:flutter/material.dart';

import 'package:odin/widgets/widgets.dart';

class InitialScreen extends StatelessWidget {
   
  const InitialScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InitialBackground()
    );
  }
}