import 'dart:ui';

import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 30,right: 25),
      child: Container(
        height: size.height * .30,
        width: size.width * .87,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.black, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
            children: [ Container(
              height: size.height * .30,
              width: size.width * .86,
              decoration: BoxDecoration(
                  color: const Color(0xFF2DBD78),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/a_card_image.png',fit: BoxFit.cover,)
              ),
            ),
              Positioned(
                left: 20,
                top: 20,
                child: Text('Regular Card',style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 15,fontWeight: FontWeight.w500),),
              ),
              Positioned(
                left: 35,
                top: 90,
                child: Text('3567 0070 0003 3256 2022',style: TextStyle(letterSpacing: 1.5,color: Colors.white.withOpacity(.8),fontSize: 21,fontWeight: FontWeight.w600),),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Text('Softcent',style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 15,fontWeight: FontWeight.w400),),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Text('Payback',style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 20,fontWeight: FontWeight.w500),),
              ),
            ]
        ),
      ),
    );
  }
}