import 'package:flutter/material.dart';
import 'package:odin/data/drawer_items.dart';
import 'package:odin/models/drawer_item.dart';
import 'package:odin/screens/screens.dart';
import 'package:odin/theme/app_themes.dart';
import 'package:odin/widgets/widgets.dart';

class DrawerScreen extends StatefulWidget {
   
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  late double xOffset;
  late double yOffset; 
  late bool isDraweOpen;
  bool isDragging = false;

  DrawerItem item = DrawerItems.home;

  @override
  void initState() {
    super.initState();

    closeDrawer();
  }

  void openDrawer() => setState(() {
    xOffset = 250;
    yOffset = 100; 
    isDraweOpen = true;
  });

  void closeDrawer() => setState(() {
    xOffset = 0;
    yOffset = 0; 
    isDraweOpen = false;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ 
          builDrawer(),
          buildPage() 
        ]
      )
    );
  }

  Widget builDrawer() => SafeArea(
      child: DrawerWidget(
        onSelectItem: (item) {
        setState(() => this.item = item);
        closeDrawer();
      },)
    );

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
          if(isDraweOpen){
            closeDrawer();
            return false;
          }else{
            return true;
          }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if(!isDragging) return;
          const delta = 1;
          if(details.delta.dx > delta){
            openDrawer();
          }else if(details.delta.dx < -delta){
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 900),
          curve: Curves.bounceOut,
          transform: Matrix4.translationValues(xOffset, yOffset, 0),
          child: AbsorbPointer(
            absorbing: isDraweOpen,
    
            child: Container(          
    
              decoration: isDraweOpen 
              ? BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const[
                  BoxShadow(
                    color: Color.fromRGBO(49,159,98,0.3),
                    // spreadRadius: 50,
                    blurRadius: 15,
                    offset: Offset(0,5)
                  )
                ]
              )
              : null ,
              
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: getDrawerPage()
                )
            )
          )
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    if(item == DrawerItems.home){
      return HomeScreen(openDrawer: openDrawer);
    }else if(item == DrawerItems.user){
      return ProfileScreen(openDrawer: openDrawer);
    }else{
      return HomeScreen(openDrawer: openDrawer);
    }
  } 
}