import 'package:flutter/material.dart';

class GreenClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = Path();
    path.lineTo(0, size.height/ 2.25);
    var firstControlPoint = Offset(size.width * 1.50 , size.height /2);
    var firstEndPoint = Offset(size.width , size.height / 3 -60);
    
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }

}