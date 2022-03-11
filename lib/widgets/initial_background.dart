import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:odin/theme/app_themes.dart';

class InitialBackground extends StatelessWidget {
  const InitialBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          //Background 
          Container(
            width: double.infinity,
            height: size.height * 1,
            child: Swiper(
              itemCount: 2,
              itemBuilder: ( BuildContext context , int index) => _Background(index),
              pagination: SwiperPagination(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.25),
                builder: const DotSwiperPaginationBuilder(
                  color: Color(0xffd6ecdf),
                  activeColor: Color(0xff66bb8b),
                  size: 15.0),
                ),
            ),
          ),
          //Bottoms

          _BottomsNavigators()
        ],
      ),
    );
  }
}

class _BottomsNavigators extends StatelessWidget {
  const _BottomsNavigators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(child: Container()),
          Container(
            width: double.infinity,
            //color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [

                MaterialButton(
                  color: Color(0xffff9a3e),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontSize: 16),),
                    ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, 'createAccount');
                  }
                ),

                SizedBox(height: 20,),

                MaterialButton(
                  color: Color(0xff49c07c),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 16),),
                    ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, 'login');
                  }
                ),

              ],
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {

  final int index;
  const _Background(this.index,);

  @override
  Widget build(BuildContext context) {

    switch(index){
      case 0:{
        return _BackgroundLigth(index: index);
      }
      case 1:{
        return _BackgroundDark(index: index);
      }
      default:{
        return _BackgroundLigth(index: index);
      }
    }
  

    
  }
}

class _BackgroundDark extends StatelessWidget {
  const _BackgroundDark({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
    color: AppThemes.colorPrimary,
    child: Column(
      children: [

        SizedBox(height: 50,),

        SafeArea(
          child: Container(
            height: 100,
            width: 100,
            decoration: _HeadIconBoxDecoration(),
            child: Icon(Icons.food_bank_outlined, size: 60, color: AppThemes.colorPrimary,),
          ),
        ),

        SizedBox(height: 40,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'SAYUR',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 15 ,),
                
                Text(
                  'Healthy Food Delivery',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.6)),
                )
              ],
            ),
          ),
        ),

        SizedBox(height: 200,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Healthy Food, for Breakfast',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 15 ,),
                
                Text(
                  'In sunt ullamco duis mollit consectetur et. Proident occaecat dolore magna id ad irure',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.6)),
                )
              ],
            ),
          ),
        ),

      ],
    ),
    );
  }
  BoxDecoration _HeadIconBoxDecoration(){

  return BoxDecoration(

    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        blurRadius: 0,
      )
    ]);  
  }
}

class _BackgroundLigth extends StatelessWidget {
  const _BackgroundLigth({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.white,
    child: Column(
      children: [

        SizedBox(height: 50,),

        SafeArea(
          child: Container(
            height: 100,
            width: 100,
            decoration: _HeadIconBoxDecoration(),
            child: Icon(Icons.food_bank_outlined, size: 60, color: AppThemes.colorPrimary,),
          ),
        ),

        SizedBox(height: 40,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'SAYUR',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,),
                  ),
                ),

                const SizedBox(height: 15 ,),
                
                Text(
                  'Healthy Food Delivery',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6)),
                )
              ],
            ),
          ),
        ),

        SizedBox(height: 200,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Healthy Food, for Breakfast',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 15 ,),
                
                Text(
                  'In sunt ullamco duis mollit consectetur et. Proident occaecat dolore magna id ad irure',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6)),
                )
              ],
            ),
          ),
        ),

      ],
    ),
    );
  }

  BoxDecoration _HeadIconBoxDecoration(){

  return BoxDecoration(

    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 10)
      )
    ]);  
    
  }

}