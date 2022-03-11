import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(delegate: SliverChildListDelegate([
            
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.deepPurple,
      expandedHeight: 250,
      floating: false,
      pinned: true,

      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('Details'),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading-image.gif'),
          image: NetworkImage('https://cdn.vox-cdn.com/thumbor/JbfIomvX3p4ChHh7rCx6N_Kux2Y=/0x0:2000x1333/1200x900/filters:focal(840x507:1160x827)/cdn.vox-cdn.com/uploads/chorus_image/image/64084261/untitled_3638__1_.32.jpg'),
          fit: BoxFit.cover,
          ),
      ),
    );
  }
}