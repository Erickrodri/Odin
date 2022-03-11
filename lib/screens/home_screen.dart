import 'package:flutter/material.dart';
import 'package:odin/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  final VoidCallback openDrawer;
   
  const HomeScreen({
    Key? key, 
    required this.openDrawer
    }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerMenuWidget(onClicked: openDrawer,),
        centerTitle: true,
        title: Container(
          child: Text('Home', style: TextStyle(color: Colors.black),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            getCategoryTable(),
            const FoodSlider(),
            const FoodSlider()
          ],
        )
      )

    
    );
  }

  Widget getCategoryTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        //Titulo
        Padding(
          padding: EdgeInsets.only(left: 25, top: 25, bottom: 20),
          child: Text(
            'Categorias',
            style: TextStyle(
              fontSize: 16, 
              color: Colors.black45, 
              fontWeight: FontWeight.bold),)
          ),
        //Tabla
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CardCategoryTable()
          )
      ],
    );
  }

}

