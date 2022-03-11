import 'package:flutter/material.dart';
import 'package:odin/widgets/drawer_menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback openDrawer;
   
  const ProfileScreen({Key? key, required this.openDrawer}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: DrawerMenuWidget(onClicked: openDrawer),
        title: Text('Profile' , style: TextStyle(color: Colors.black),),
      ),
      body: Center(
         child: Text('ProfileScreen'),
      ),
    );
  }
}