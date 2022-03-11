import 'package:flutter/material.dart';

class CardCategoryTable extends StatelessWidget {
  const CardCategoryTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCardCategory(title: 'Accion', icon: Icons.movie,),
            _SingleCardCategory(title: 'Terror', icon: Icons.movie,),
            _SingleCardCategory(title: 'Accion', icon: Icons.movie,),
            _SingleCardCategory(title: 'Accion', icon: Icons.movie,),
          ]
        ),
        TableRow(
          children: [
             _SingleCardCategory(title: 'Accion', icon: Icons.movie_creation_outlined),
             _SingleCardCategory(title: 'Accion', icon: Icons.movie_creation_outlined),
             _SingleCardCategory(title: 'Accion', icon: Icons.movie_creation_outlined),
             _SingleCardCategory(title: 'Accion', icon: Icons.movie_creation_outlined),
          ]
        )
      ],
    );
  }
}

class _SingleCardCategory extends StatelessWidget {

  final String title;
  final IconData icon;

  const _SingleCardCategory({
    Key? key, 
    required this.title, 
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        GestureDetector(
          onTap: (){
            print(title);
          },
          child: Container(
            margin: EdgeInsets.all(7),
            height: 75,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                  spreadRadius: 0.5,
                  offset: Offset(0,0)
                )
              ]
            ),
            child: Icon(icon, size: 30,),
          ),
        ),

        Text(title),
        SizedBox(height: 5,)
      ]
    );
  }
}