import 'package:flutter/material.dart';
import 'package:odin/theme/app_themes.dart';

class AuthBackground extends StatelessWidget {

  final Widget child;
  final String? textTitle;
  final String? textSubtitle;

  const AuthBackground({
    Key? key, 
    required this.child, 
    this.textTitle,
    this.textSubtitle
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.green,
      child: Stack(
        children: [

          _Background(textTitle, textSubtitle),
       
          child
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {

  final String? textTitle;
  final String? textSubtitle;

  const _Background(
    this.textTitle, 
    this.textSubtitle
    );


  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      child: Column(
        children: [
          const SizedBox(height: 50,),
          _HeadIcon(),
          const SizedBox(height: 40,),
          _HeadText(textTitle, textSubtitle)
        ],
      )
    );
  }
}

class _HeadIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        height: 100,
        width: 100,
        decoration: _HeadIconBoxDecoration(),
        child: Icon(Icons.food_bank_outlined, size: 60, color: AppThemes.colorPrimary,),
      ),
    );
  }
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
    ]
  );
}

class _HeadText extends StatelessWidget {

  final String? textTitle;
  final String? textSubtitle;

  const _HeadText(
    this.textTitle, 
    this.textSubtitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                textTitle != null ? textTitle! : '',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15 ,),
            
            Text(
              textSubtitle != null ? textSubtitle! : '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6)),
            )
          ],
        ),
      ),
    );
  }
}