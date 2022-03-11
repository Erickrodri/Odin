import 'package:flutter/material.dart';

class FoodSlider extends StatelessWidget {
  const FoodSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              'PopularesN', 
              style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
          ),

          const SizedBox(height: 5),

          Expanded(
            child: ListView.builder(
              //controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 5,//widget.movies.length,
              itemBuilder: (BuildContext context, int index) => _MoviePoster() //_MoviePoster(movie: widget.movies[index])
            ),
          ),

        ],
      ),
    );
  }
}


class _MoviePoster extends StatelessWidget {

  // final Movie movie;

  // const _MoviePoster({ required this.movie});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric( horizontal: 10),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details'),//, arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                placeholder: AssetImage('assets/loading-image.gif'),
                image: NetworkImage('https://cdn.vox-cdn.com/thumbor/JbfIomvX3p4ChHh7rCx6N_Kux2Y=/0x0:2000x1333/1200x900/filters:focal(840x507:1160x827)/cdn.vox-cdn.com/uploads/chorus_image/image/64084261/untitled_3638__1_.32.jpg'),
                height: 190,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 5,),

          Text(
            'title',//movie.title, 
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )

        ],
      ),
    );
  }
}