import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppClipper extends CustomClipper<Path>{
  final double cornerSize;
  final double diagonalHeight;
  final bool roundedButton;
  AppClipper({this.cornerSize,this.diagonalHeight,this.roundedButton=true});
  @override
  Path getClip(Size size) {
    Path path=new Path();

    path.moveTo(0, cornerSize*1.5);
    path.lineTo(0, size.height -(roundedButton ?cornerSize:0));

    if(roundedButton)
    path.quadraticBezierTo(0,size.height, cornerSize, size.height);
    path.lineTo(size.width-(roundedButton ?cornerSize:0),size.height);

    if(roundedButton)
    path.quadraticBezierTo(size.width,size.height,size.width, size.height-cornerSize);
    path.lineTo(size.width, diagonalHeight+cornerSize);
    path.quadraticBezierTo(size.width, diagonalHeight, size.width-cornerSize, diagonalHeight*.9);
    path.lineTo(cornerSize*2, cornerSize);
    path.quadraticBezierTo(0, 0, 0,cornerSize*1.5);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>true;


}